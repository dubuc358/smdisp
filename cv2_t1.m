%------------------------ELASTIC MODULI TENSOR----------------------------%


%DESCRPIPTION
%- Outputs voigt form of the elastic moduli tensor.

%NOTES
%- For transversely isotropic symmetry.
%- Assumes the isotropy plane is normal to the x1 axis.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [c] = cv2_t1(c11,c12,c23,c33,c66)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% c11,c12,...   : independent voigt elastic constants.


% c             : voigt form of elastic moduli tensor.

%%  VOIGT MATRIX

c   = zeros(6,6);
c(1,1) = c11;
c(2,2) = c33;
c(3,3) = c33;
c(1,2) = c12;
c(1,3) = c12;
c(2,3) = c23;
c(4,4) = 1/2*(c33-c23);
c(5,5) = c66;
c(6,6) = c66;
%symmetrize.
for i = 1:6
    for j = 1:6
        v       = [c(i,j),c(j,i)];
        [~,ind] = max(abs(v));
        c(i,j) = v(ind);
    end
end




