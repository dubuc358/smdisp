function    [a1,a2] = lame2rivlin(lam,mu)

a1  = -mu/2;
a2  = (lam+2*mu)/8;