%-------------------------ACOUSTOELASTIC TENSOR---------------------------%


%DESCRIPTION
%- Outputs acoustoelastic tensor used in the equation of motion.

%NOTES
%- References natural configuration.
%- Derivative of acoustoelastic tensor with respect to x_3 coordinate.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [a] = ca0p(r,c2,c3,e,w)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% r             : 3x3 matrix of direction cosines.
%                   -a(i,j) : direction cosine between y_i and x_j axes,
%                   where y_i are the new coordinates and x_i the original.
%
% c2            : tensor of second order elastic constants [Pa].
%
% c3            : tensor of third order elastic constants [Pa].
%
% e             : derivative of small strain tensor, in 3x3 matrix.
%                   -derivative of each component with respect to x_3
%                   coordinate, d e_{ij}/d x_3.
%                   -derivatives evaluated at given x_3 coordinate value.
%
% w             : derivative of rigid rotation tensor, in 3x3 matrix.
%                   -derivative of each component with respect to x_3
%                   coordinate, d w_{ij}/d x_3.
%                   -derivatives evaluated at given x_3 coordinate value.


% a             : acoustoelastic tensor for equation of motion, referenced
%                   to rotated coordinates.

%%  COMPUTE

%%  referenced to principal directions.
ap  = zeros(3,3,3);
for i = 1:3
    for k = 1:3
        for l = 1:3
            for m = 1:3
                ap(i,k,l) = ap(i,k,l) + c2(m,3,k,l)*(e(i,m)+w(i,m))+...
                                        c2(i,3,m,l)*(e(k,m)+w(k,m));
                for n = 1:3
                    ap(i,k,l) = ap(i,k,l) + c3(i,3,k,l,m,n)*e(m,n);
                end
            end
        end
    end
end
%%  referenced to rotated coordinates.
if r == eye(3,3)
    a   = ap;
else
    a   = tensrot(ap,r);
end








