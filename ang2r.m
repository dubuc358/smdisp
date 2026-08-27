%--------------------------ROTATION MATRIX--------------------------------%


%DESCRIPTION
%- Converts rotation angle into a rotation matrix.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [r] = ang2r(phi)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% phi           : rotation angle [rad] about the x3 axis.


% r             : 3x3 matrix of direction cosines.

%%  ROTATION MATRIX

if phi == 0
    r   = eye(3,3);
else
    r   = [     cos(phi), cos(pi/2-phi), 0;...
           cos(pi/2+phi),      cos(phi), 0;...
                       0,             0, 1];
end




