function    [eta] = etaterms(Drho,alp,p)

eta     = zeros(2,1);
eta(1)  = Drho/(alp(1)-2*p);
eta(2)  = Drho/alp(5);