function    [bet] = betaterms(alp,Psi,p,l_r,l_z,Dr)

bet     = zeros(4,1);
bet(1)  = 1i/l_z;
bet(2)  = alp(1)-2*p;
bet(3)  = (alp(1)+2*l_r^4*Psi)/Dr;
bet(4)  = 1i*alp(2)/l_z;