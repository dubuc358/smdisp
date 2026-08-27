%------------------------ELASTIC MODULI TENSOR----------------------------%


%DESCRPIPTION
%- Outputs voigt form of the third order elastic moduli tensor.

%NOTES
%- For transversely isotropic symmetry.
%- Assumes the isotropy plane is normal to the x1 axis.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [c] = cv3_t1(c111,c112,c122,c123,c155,c223,c255,c266,c333)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% c111,c112,... : independent voigt elastic constants.


% c             : voigt form of elastic moduli tensor.

%%  VOIGT MATRIX

c   = zeros(6,6,6);
c(1,1,1) = c111;
c(2,2,2) = c333;
c(3,3,3) = c333;
c(1,4,4) = 1/2*(c122-c123);
c(2,5,5) = c255;
c(3,6,6) = c255;
c(1,1,2) = c112;
c(2,2,3) = c223;
c(1,3,3) = c122;
c(1,1,3) = c112;
c(1,2,2) = c122;
c(2,3,3) = c223;
c(1,6,6) = c155;
c(1,5,5) = c155;
c(2,4,4) = 1/4*(c333-c223);
c(3,4,4) = 1/4*(c333-c223);
c(2,6,6) = c266;
c(3,5,5) = c266;
c(1,2,3) = c123;
c(4,5,6) = 1/2*(c266-c255);
%symmetrize.
for i = 1:6
    for j = 1:6
        for k = 1:6
            v       = [c(i,j,k),c(j,i,k),c(i,k,j),...
                       c(k,j,i),c(k,i,j),c(j,k,i)];
            [~,ind] = max(abs(v));
            c(i,j,k) = v(ind);
        end
    end
end





