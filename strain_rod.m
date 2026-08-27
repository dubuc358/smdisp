function    [e_r,e_z] = strain_rod(s,E,nu)

e_z     = s/E;
e_r     = -nu*e_z;