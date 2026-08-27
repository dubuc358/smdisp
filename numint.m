%-------------------------------------------------------------------------%


%DESCRIPTION
%- Numerical integration.

%NOTES
%- For integration over a bounded interval [-h,h].
%- From Boyd2000.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [int] = numint(f,w,h)

%%  INFORMATION

% f     : integrand, sampled at points from 'intx.m'.
%
% w     : quadrature weights, from 'intwt.m'.
%
% h     : integration bound, where integrand is over [-h,h].


% int   : integral.

%%  INTEGRATE

int     = h*dot(w,f);