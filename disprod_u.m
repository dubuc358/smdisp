function [w_m,f_m,k_m,cp_m,cg_m,x_i,u_m] = disprod_u(mod,mat,d,f_lim,N_c,N_s,s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Computes longitudinal-mode dispersion curve and modeshape solutions for
% an isotropic elastic rod under uniform axial stress (referenced to the
% undeformed geometry of the rod).
% Uses the spectral method to obtain a numerical solution.
% Based on work from the following:
% [1] B Dubuc, et al. "Higher order longitudinal guided wave modes in
% axially stressed seven-wire strands" (2018)
% [2] B Dubuc, et al. "Computation of propagating and non-propagating
% guided modes in nonuniformly stressed plates using spectral methods"
% (2018)
%
% INPUT:
% mod   : Mode types to compute (string).
%   'p'   : Propagating modes (real wavenumber).
%   'pnp' : Propagating and non-propagating modes (complex wavenumber).
% mat   : Material ID number (scalar).
%   See matsym.m.
% d     : Rod diameter (scalar) [m].
% f_lim : Highest frequency to compute up to (scalar) [Hz].
% N_c   : Number of collocation points (scalar).
%   Number of modes output is equal to 1/2 of this number.
% N_s   : Number of solution points (scalar).
% s     : Axial stress [MPa].
% 
% OUTPUT:
% w_m   : Columnwise angular frequencies for each mode (matrix) [rad/s].
% f_m   : Columnwise frequencies for each mode (matrix) [Hz].
% k_m   : Columnwise wavenumbers for each mode (matrix) [rad/m].
% cp_m  : Columnwise phase velocities for each mode (matrix) [m/s].
% cg_m  : Columnwise group velocities for each mode (matrix) [m/s].
%   More solution points will give more accurate group velocity values,
%   since this is based on a crude finite difference calculation.
% x_i   : Radial collocation point locations (vector) [m].
% u_m   : Displacement modeshapes (4D array) [m].
%   Dim. 1 : Collocation point.
%   Dim. 2 : Cylindrical coordinate (axial,angular,radial).
%   Dim. 3 : Solution point.
%   Dim. 4 : Mode.
%
% EXAMPLE:
% >> disprod_u('p', 1.3, 1e-3, 50e6, 26, 1000, 400);
% The above computes solutions for the first 13 modes in a 1 mm diameter
% Hecla 17 steel rod under 400 MPa axial stress. Solutions are obtained up
% to 50 MHz, sampled across 1,000 wavenumbers.
%
% Created by:
% Brennan Dubuc
% Applied Research Laboratories, The University of Texas at Austin
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  begin.

if strcmp(mod,'p') == 1%propagating modes only.
    [w_m,f_m,k_m,cp_m,cg_m,x_i,u_m] = displong_u_k(mat,d,f_lim,N_c,N_s,s);
elseif strcmp(mod,'pnp') == 1%propagating and nonpropagating modes.
    [w_m,f_m,k_m,cp_m,x_i,u_m] = displong_u_w(mat,d,f_lim,N_c,N_s,s);
    warning('Group velocities not currently supported.')
    cg_m    = NaN;
end