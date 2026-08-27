%----------------THIRD ORDER ELASTIC CONSTANT CONVERTER-------------------%


%DESCRIPTION
%- Converts the third order tensor constants to Murnaghan constants.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [l,m,n] = tens2murn(c111,c112,c123)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v   = [c111;c112;c123];
C   = [2, 4,0;...
       2, 0,0;...
       2,-2,1];
r   = C\v;
inv(C)

l   = r(1);
m   = r(2);
n   = r(3);









