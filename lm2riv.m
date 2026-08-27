function    [a] = lm2riv(lam,mu,l,m,n)

a       = zeros(5,1);
a(1)    = -1/2*mu;
a(2)    = 1/8*(lam+2*mu);
a(3)    = -1/4*m;
a(4)    = 1/24*(l+2*m);
a(5)    = 1/8*n;