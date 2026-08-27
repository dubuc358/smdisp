%----------------SECOND ORDER ELASTIC CONSTANT CONVERTER------------------%


%DESCRIPTION
%- Converts Lame constants into Young's modulus and Poisson ratio.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [lam,mu] = young2lame(E,nu)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lam     = E*nu/((1+nu)*(1-2*nu));
mu      = E/(2*(1+nu));









