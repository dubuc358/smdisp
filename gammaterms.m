function    [gam] = gammaterms(alp,Phi,Psi,p,l_r,l_z,s)

gam     = zeros(4,1);
gam(1)  = -l_z^2*(Phi+l_r^2*Psi)/(alp(1)-2*p)/l_z^2;
gam(2)  = 1i*(alp(2)+alp(5))/(alp(1)-2*p)/l_z;
gam(3)  = 1i*(alp(3)+alp(5)+s)/alp(5)/l_z;
gam(4)  = -(alp(4)+2*s)/alp(5)/l_z^2;