%-----------------------------EXTRAPOLATE---------------------------------%


%DESCRIPTION
%- Uses a parabolic interpolation between three neighboring points to
%extrapolate to the next point.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [y_e]   = extrap(x,y,x_e)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% x     : 3x1 vector of independent variable values.
%           -entries are ordered from least to most recent.
%
% y     : 3x1 vector of dependent variable values.
%           -entries are ordered the same as 'x'.
%
% x_e   : independent variable value that 'y_e' is sought for.


% y_e   : extrapolated dependent variable at the 'x_e' value.

%%  EXTRAPOLATE

%%  make 'x(1)' reference zero point.
x1  = x(1);
x2  = x(2)-x1;
x3  = x(3)-x1;
x   = [0;x2;x3];
%%  polynomial coefficients.
a   = 1/(x2-x3)*[-x3/x2  x2/x3;...
                  1/x2  -1/x3]*[y(2)-y(1);y(3)-y(1)];
%%  extrapolate.
y_e = y(1)+a(1)*(x_e-x1)+a(2)*(x_e-x1)^2;






