function    [w,w_lim,k_lim,c_l,c_2r] = out_freq(c_2,rot,rho,f_lim,N_s)

c_2r    = tensrot(c_2,rot);
%velocities.
c_t     = sqrt(min([c_2r(1,2,1,2),c_2r(1,3,1,3)])/rho);
c_l     = sqrt(c_2r(1,1,1,1)/rho);
%frequency range.
w_lim   = 2*pi*f_lim;%max angular frequency.
k_lim   = 1.1*w_lim/c_t;%max wavenumber.
w       = linspace(w_lim/N_s,w_lim,N_s).';