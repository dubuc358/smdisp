%-------------------------ACOUSTOELASTIC TENSOR---------------------------%


%DESCRIPTION
%- Outputs acoustoelastic tensor used in the constitutive equation.

%NOTES
%- References natural configuration.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [b] = cb0(r,c2,c3,e,w)

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


% b             : acoustoelastic tensor for the constitutive equation,
%                   referenced to rotated coordinates.

%%  COMPUTE

%%  referenced to principal directions.
bp  = zeros(3,3,3,3);
for i = 1:3
    for j = 1:3
        for k = 1:3
            for l = 1:3
                bp(i,j,k,l) = bp(i,j,k,l) + c2(i,j,k,l);
                for m = 1:3
                    bp(i,j,k,l) = bp(i,j,k,l) + c2(i,j,m,l)*(e(k,m)+w(k,m));
                    for n = 1:3
                        bp(i,j,k,l) = bp(i,j,k,l) + c3(i,j,k,l,m,n)*e(m,n);
                    end
                end
            end
        end
    end
end
%%  referenced to rotated coordinates.
if r == eye(3,3)
    b   = bp;
else
    b   = tensrot(bp,r);
end








