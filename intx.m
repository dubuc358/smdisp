%-------------------------------------------------------------------------%


%DESCRIPTION
%- Quadrature points.

%NOTES
%- For integration over a bounded interval.
%- From Boyd2000.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [x] = intx(N)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% N     : number of sample points.


% x     : vector of points.

%%  POINTS

i   = (1:N).';
x   = cos(pi/(N+1)*i);