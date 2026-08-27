function    [lam,mu] = tens2lame(c_2)

lam     = c_2(1,1,2,2);
mu      = c_2(2,3,2,3);