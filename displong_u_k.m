%-------------------------------------------------------------------------%


%DESCRIPTION
%- Computes dispersion curves.

%NOTES
%- Computes longitudinal guided wave modes in a stressed isotropic rod.
%- Assumes uniform axial stress.
%- Solves for frequency given real wavenumber.
%- Naming:
%   long    : longitudinal
%   u       : uniform
%   k       : wavenumber


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [w_m,f_m,k_m,cp_m,cg_m,x,u_m] = displong_u_k(mat,d,f_lim,N_c,N_s,s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  INFORMATION

% mat       : material identification number.
%
% d         : diameter [m].
%
% f_lim     : maximum frequency computed [Hz].
%
% N_c       : number of collocation points.
%
% N_s       : number of solution points.
%
% s         : axial stress [MPa].


% w_m       : columnwise angular frequency [rad/s] solutions for each mode.
%
% f_m       : columnwise frequency [Hz] solutions for each mode.
%
% k_m       : columnwise real wavenumber [rad/m] solutions for each mode.
%
% cp_m      : columnwise phase velocity [m/s] solutions for each mode.
%
% cg_m      : columnwise group velocity [m/s] solutions for each mode.
%
% x         : collocation points.
%
% u_m       : r,the,z modeshape solutions for each mode.

%%  CHECKS

checks_rod(N_c)

%%  INITIALIZE

tic
fprintf('Initializing...\n')

%%  number of modes.
N_m     = floor(N_c/2);


%%  initialize.
[rho,c_2,lam,x_i,D1,D2,R,bet,gam,eta,Dr] = initializerod_u(mat,s,N_c,d);


%%  wavenumber.
[k,w_lim,k_lim,c_l] = out_wav(c_2,eye(3,3),rho,f_lim,N_s);


%%  DISPERSION CURVES

toc
fprintf('Computing dispersion curves...\n')

%%  mass matrix.
M       = zeros(2*N_c,2*N_c);
%apply equation of motion.
M(1:N_c,1:N_c)              = -eta(1)*eye(N_c,N_c);
M(N_c+1:2*N_c,N_c+1:2*N_c)  = -eta(2)*eye(N_c,N_c);

%apply boundary conditions.

%free.
M(1,1)         = 0;%surface.
M(N_c+1,N_c+1) = 0;%surface.
M(N_c,N_c)     = 0;%core.
M(2*N_c,2*N_c) = 0;%core.

% %mixed.
% M(N_c+1,N_c+1) = 0;%surface.
% M(N_c,N_c)     = 0;%core.
% M(2*N_c,2*N_c) = 0;%core.
% M(1,:)  = [];
% M(:,1)  = [];

% %rigid.
% M(N_c,N_c)     = 0;%core.
% M(2*N_c,2*N_c) = 0;%core.
% M(1,:)  = [];
% M(:,1)  = [];
% M(N_c+1-1,:)  = [];
% M(:,N_c+1-1)  = [];

%% compute.
k_m     = k*ones(1,N_m);
w_m     = zeros(N_s,N_m);
u_m     = zeros(3,N_c,N_m,N_s);
%cycle through wavenumber.
for i = 1:N_s
    k_i     = k(i);%current wavenumber.
    %%  equation of motion.
    %equation of motion.
    Q_11    = D2+diag(1./R)*D1-diag(1./(R.^2))+k_i^2*gam(1)*eye(N_c,N_c);
    Q_12    = k_i*gam(2)*D1;
    Q_21    = k_i*gam(3)*(D1+diag(1./R));
    Q_22    = D2+diag(1./R)*D1+k_i^2*gam(4)*eye(N_c,N_c);
    %%  boundary conditions.
    %stress at surface.
    B_11    = k_i*bet(1)*eye(1,N_c);%shear.
    B_12    = D1(1,:);%shear.
    B_21    = bet(2)*D1(1,:)+bet(3)*eye(1,N_c);%normal.
    B_22    = k_i*bet(4)*eye(1,N_c);%normal.
    %displacement at core.
    D_11    = [zeros(1,N_c-1),-1];
    D_12    = zeros(1,N_c);
    D_21    = zeros(1,N_c);
    D_22    = D1(N_c,:);
    %%  differential operator.
    %apply equation of motion.
    L       = [Q_11,Q_12;...
               Q_21,Q_22];
    %apply boundary conditions, scale to similar order of magnitude as
    %equation of motion.
    
    %free conditions.
    L(1,:)      =       1/Dr*[B_11,B_12];
    L(N_c+1,:)  = 1/(Dr*lam)*[B_21,B_22];
    L(N_c,:)    =     1/Dr^2*[D_11,D_12];
    L(2*N_c,:)  =       1/Dr*[D_21,D_22];
    
%     %mixed conditions - shear 0 - normal displacement 0.
%     L(N_c+1,:)  =     [B_11,B_12];
%     L(N_c,:)    =     [D_11,D_12];
%     L(2*N_c,:)  =     [D_21,D_22];
%     L(1,:)  = [];
%     L(:,1)  = [];

%     %rigid.
%     L(N_c,:)    =     [D_11,D_12];
%     L(2*N_c,:)  =     [D_21,D_22];
%     L(1,:)  = [];
%     L(:,1)  = [];
%     L(N_c+1-1,:)  = [];
%     L(:,N_c+1-1)  = [];
    
    %%  eigenvalue problem.
    %solve.
    [w,u]   = out_eigk(L,M,N_m);
    %store.
    w_m(i,:)     = w.';%store angular frequency.
    
    %free.
    u_m(3,:,:,i) = u(    1:  N_c,:);%store r mode shape.
    u_m(1,:,:,i) = u(N_c+1:2*N_c,:);%store z mode shape.
    
%     %mixed.
%     u_m(3,:,:,i) = [zeros(1,N_m);...
%                     u(    1:  N_c-1,:)];%store r mode shape.
%     u_m(1,:,:,i) =  u(  N_c:2*N_c-1,:);%store z mode shape.

%     %rigid.
%     u_m(3,:,:,i) = [zeros(1,N_m);...
%                     u(    1:  N_c-1,:)];%store r mode shape.
%     u_m(1,:,:,i) = [zeros(1,N_m);...
%                     u(  N_c:2*N_c-2,:)];%store z mode shape.
end
%rearrange modeshape.
u_m     = permute(u_m,[2,1,4,3]);
%rename real collocation points.
x       = d/4*(x_i+1);


%%  POSTPROCESS

[w_m,k_m,u_m] = dot2line(w_m,k_m,u_m);

toc
fprintf('Postprocessing...\n')
f_m     = 1/2/pi*w_m;%frequency.
cp_m    = w_m./k_m;%phase velocity.
% Simple finite difference-based group velocity.
cg_m    = (w_m(3:end,:)-w_m(1:end-2,:)) ./ (k_m(3:end,:)-k_m(1:end-2,:));
cg1     = (w_m(2,:)-w_m(1,:)) ./ (k_m(2,:)-k_m(1,:));
cg2     = (w_m(end,:)-w_m(end-1,:)) ./ (k_m(end,:)-k_m(end-1,:));
cg_m    = [cg1; cg_m; cg2];
toc


%%  PLOTTING

%%  wavenumber.
plotrwav(w_lim,k_lim,w_m,k_m)

%%  phase velocity.
plotvphase(f_lim,c_l,f_m,cp_m)

%%  group velocity.
plotvgroup(f_lim,c_l,f_m,cg_m)