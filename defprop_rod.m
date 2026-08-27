function    [Drho,Dr] = defprop_rod(rho,r,e_r,e_z)

d       = 2*e_r+e_z;%dilatation.
Drho    = rho*(1-d);%deformed density.
Dr      = (1+e_r)*r;%deformed density.
