function    [k,w_lim,k_lim,c_l] = out_wav(c_2,rot,rho,f_lim,N_s)

c_2r    = tensrot(c_2,rot);
%velocities.
c_t     = sqrt(min([c_2r(1,2,1,2),c_2r(1,3,1,3)])/rho);
c_l     = sqrt(c_2r(1,1,1,1)/rho);
%wavenumber range.
w_lim   = 2*pi*f_lim;%max angular frequency.
k_lim   = 1.3*w_lim/c_t;%max wavenumber.
k       = linspace(k_lim/N_s,k_lim,N_s).';