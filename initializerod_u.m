function    [rho,c_2,lam,x_i,D1,D2,R,bet,gam,eta,Dr] = initializerod_u(mat,s,N_c,d)

%%  density and elastic constants.
[rho,c_2,~,~,cv_3] = matsym('iso',mat);
%lame constants.
[lam,mu] = tens2lame(c_2);
%youngs constants.
[E,nu]  = lame2young(lam,mu);
%murnaghan constants.
[ml,mm,mn] = tens2murn(cv_3(1,1,1),cv_3(1,1,2),cv_3(1,2,3));
%rivlin constants.
[a]     = lm2riv(lam,mu,ml,mm,mn);
%% strain.
s       = 1e6*s;%convert to pascal.
%strains.
[e_r,e_z] = strain_rod(s,E,nu);
%check for large strains.
checkstrain([e_r,e_z])
%stretches.
l_r     = 1+e_r;
l_z     = 1+e_z;
%% geometry.
r       = d/2;%radius.
[Drho,Dr] = defprop_rod(rho,r,e_r,e_z);%deformed density and radius.
%% differentiation matrix and collocation.
[x_i,D] = chebdif(N_c,2);
R       = Dr/2*(x_i+1);%radial collocation points.
D1      = (2/Dr)*D(:,:,1);%first derivative.
D2      = (2/Dr)^2*D(:,:,2);%second derivative.
%% rod terms.
%general terms.
[alp,Phi,Psi,p] = rodterms(l_r,l_z,a);
%beta terms.
[bet]   = betaterms(alp,Psi,p,l_r,l_z,Dr);
%gamma terms.
[gam]   = gammaterms(alp,Phi,Psi,p,l_r,l_z,s);
%eta terms in mass matrix.
[eta]   = etaterms(Drho,alp,p);