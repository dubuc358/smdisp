function    [a3,a4,a5] = murn2rivlin(l,m,n)

a3  = -m/4;
a4  = (l+2*m)/24;
a5  = n/8;


v   = [l,m,n].';
C   = [0,-1/4,0;...
       1/24,1/12,0;...
       0,0,1/8];
r   = C*v;

inv(C)
