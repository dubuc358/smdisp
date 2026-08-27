%----------------SECOND ORDER ELASTIC CONSTANT CONVERTER------------------%


%DESCRIPTION
%- Converts Lame constants into Young's modulus and Poisson ratio.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [E,nu] = lame2young(lam,mu)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nu      = lam/(2*(lam+mu));
E       = 2*mu*(1+nu);









