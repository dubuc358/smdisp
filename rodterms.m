function    [alp,Phi,Psi,p] = rodterms(l_r,l_z,a)

%dilatation.
d       = 2*l_r+l_z-3;
%strain energy function derivatives.
W1      = a(5)-2*a(1)+4*(a(2)-a(3))*d;
W2      = a(1)-a(5)+2*a(3)*d;
W3      = a(5);
W11     = 2*(a(2)-2*a(3))+12*a(4)*d;
W12     = a(3);
%derivatives.
Phi     = 2/l_z/l_r^2*W1;
Psi     = 2/l_z/l_r^2*W2;
p       = 2*l_z*l_r^2*W3;
A       = 2/l_z/l_r^2*W11;
F       = 2/l_z/l_r^2*W12;
%alpha terms.
alp     = zeros(5,1);
alp(1)  = 2*l_r^4*(                A+...
                   2*(l_z^2+l_r^2)*F)-...
          2*l_r^2*(Phi+(l_z^2+l_r^2)*Psi);
alp(2)  = 2*l_z^2*l_r^2*(                A+...
                         (l_z^2+3*l_r^2)*F)-...
          2*l_r^2*(Phi+l_r^2*Psi);
alp(3)  = alp(2)-...
          (l_z^2-l_r^2)*(Phi+l_r^2*Psi);
alp(4)  = 2*l_z^4*(        A+...
                   4*l_r^2*F)-...
          (l_z^2-l_r^2)*(Phi+l_r^2*Psi);
alp(5)  = l_r^2*(Phi+l_r^2*Psi);