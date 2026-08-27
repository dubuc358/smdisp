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
%   w       : angular frequency


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [w_m,f_m,k_m,cp_m,x,u_m] = displong_u_w(mat,d,f_lim,N_c,N_s,s)

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
%%  frequency.
[w,w_lim,k_lim,c_l] = out_freq(c_2,eye(3,3),rho,f_lim,N_s);
%%  equation of motion.
Q2      = [             gam(1)*eye(N_c,N_c),     zeros(N_c,N_c);...
                             zeros(N_c,N_c),gam(4)*eye(N_c,N_c)];
Q1      = [                  zeros(N_c,N_c),          gam(2)*D1;...
                     gam(3)*(D1+diag(1./R)),     zeros(N_c,N_c)];
Q0      = [D2+diag(1./R)*D1-diag(1./(R.^2)),     zeros(N_c,N_c);...
                             zeros(N_c,N_c),   D2+diag(1./R)*D1];
%%  stress.
B2      = zeros(2*N_c,2*N_c);
B1      = [          bet(1)*eye(N_c,N_c),     zeros(N_c,N_c);...
                          zeros(N_c,N_c),bet(4)*eye(N_c,N_c)];
B0      = [               zeros(N_c,N_c),                 D1;...
           bet(2)*D1+bet(3)*eye(N_c,N_c),     zeros(N_c,N_c)];
%%  displacement.
DS2     = zeros(2*N_c,2*N_c);
DS1     = zeros(2*N_c,2*N_c);
DS0     = [ -eye(N_c,N_c),zeros(N_c,N_c);...
           zeros(N_c,N_c),            D1];
%%  boundary condition.
%stress.
Q2(1,:) = 1/Dr*B2(1,:);
Q1(1,:) = 1/Dr*B1(1,:);
Q0(1,:) = 1/Dr*B0(1,:);
Q2(N_c+1,:) = 1/(Dr*lam)*B2(N_c+1,:);
Q1(N_c+1,:) = 1/(Dr*lam)*B1(N_c+1,:);
Q0(N_c+1,:) = 1/(Dr*lam)*B0(N_c+1,:);
%displacement.
Q2(N_c,:) = 1/Dr^2*DS2(N_c,:);
Q1(N_c,:) = 1/Dr^2*DS1(N_c,:);
Q0(N_c,:) = 1/Dr^2*DS0(N_c,:);
Q2(2*N_c,:) = 1/Dr*DS2(2*N_c,:);
Q1(2*N_c,:) = 1/Dr*DS1(2*N_c,:);
Q0(2*N_c,:) = 1/Dr*DS0(2*N_c,:);
%%  scale factor.
alp     = lam;

%%  DISPERSION CURVES

toc
fprintf('Computing dispersion curves...\n')
%% compute.
w_m     = w*ones(1,N_m);
k_m     = zeros(N_s,N_m);
u_m     = zeros(3,N_c,N_m,N_s);
%cycle through wavenumber.
for i = 1:N_s
    w_i     = w(i);%current frequency.
    %%  mass matrix.
    M       = zeros(2*N_c,2*N_c);
    %apply equation of motion.
    M(    1:  N_c,    1:  N_c) = eta(1)*w_i^2*eye(N_c,N_c);
    M(N_c+1:2*N_c,N_c+1:2*N_c) = eta(2)*w_i^2*eye(N_c,N_c);
    %apply boundary conditions.
    M(1,1)         = 0;%surface.
    M(N_c+1,N_c+1) = 0;%surface.
    M(N_c,N_c)     = 0;%core.
    M(2*N_c,2*N_c) = 0;%core.
    %%  eigenvalue problem.
    %matrices.
    A       = [                  Q1,                Q0+M;...
               alp*eye(2*N_c,2*N_c),  zeros(2*N_c,2*N_c)];
    B       = [                 -Q2,  zeros(2*N_c,2*N_c);...
                 zeros(2*N_c,2*N_c),alp*eye(2*N_c,2*N_c)];
    %solve.
    [X,k]   = eig(A,B,'vector');
    %extract modeshapes.
    u       = X(2*N_c+1:4*N_c,:);
    %clean solutions.
    [k,u]   = clean(k,u,3,2*N_c);
    %%  store.
    k_m(i,:)     = k(1:N_m).';
    u_m(3,:,:,i) = u(    1:  N_c,1:N_m);%store r mode shape.
    u_m(1,:,:,i) = u(N_c+1:2*N_c,1:N_m);%store z mode shape.
end
%rearrange modeshape.
u_m     = permute(u_m,[2,1,4,3]);
%rename real collocation points.
x       = d/4*(x_i+1);

%%  POSTPROCESS

toc
fprintf('Postprocessing...\n')
f_m     = 1/2/pi*w_m;%frequency.
cp_m    = w_m./real(k_m);%phase velocity.
toc

%%  PLOTTING

%%  real wavenumber.
plotrwav(w_lim,k_lim,w_m,k_m)
%%  imaginary wavenumber.
plotiwav(w_lim,k_lim,w_m,k_m)
%%  wavenumber.
plotwav(w_lim,k_lim,w_m,k_m)
%%  phase velocity.
plotvphase(f_lim,c_l,f_m,cp_m)



