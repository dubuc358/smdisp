%-------------------------ACOUSTOELASTIC TENSOR---------------------------%


%DESCRIPTION
%- Outputs acoustoelastic tensor used in the equation of motion.

%NOTES
%- References natural configuration.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [a] = ca0(r,c2,c3,e,w)

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
% e             : small strain tensor.
%
% w             : rigid rotation tensor.


% a             : acoustoelastic tensor for equation of motion, referenced
%                   to rotated coordinates.

%%  COMPUTE

%%  referenced to principal directions.
ap  = zeros(3,3,3,3);
for i = 1:3
    for j = 1:3
        for k = 1:3
            for l = 1:3
                ap(i,j,k,l) = ap(i,j,k,l) + c2(i,j,k,l);
                for m = 1:3
                    ap(i,j,k,l) = ap(i,j,k,l) + c2(m,j,k,l)*(e(i,m)+w(i,m))+...
                                                c2(i,j,m,l)*(e(k,m)+w(k,m));
                    for n = 1:3
                        ap(i,j,k,l) = ap(i,j,k,l) + c2(j,l,m,n)*e(m,n)*kd(i,k)+...
                                                    c3(i,j,k,l,m,n)*e(m,n);
                    end
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








