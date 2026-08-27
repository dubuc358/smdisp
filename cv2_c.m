%------------------------ELASTIC MODULI TENSOR----------------------------%


%DESCRPIPTION
%- Outputs voigt form of the elastic moduli tensor.

%NOTES
%- For cubic symmetry.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [c] = cv2_c(c11,c12,c44)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% c11,c12,c44   : independent voigt elastic constants.


% c             : voigt form of elastic moduli tensor.

%%  VOIGT MATRIX

if strcmp(class([c11,c12,c44]),'sym') == 1
    %%  symbolic input.
    c   = sym(zeros(6,6));
    c(1,1) = c11;
    c(2,2) = c11;
    c(3,3) = c11;
    c(1,2) = c12;
    c(1,3) = c12;
    c(2,3) = c12;
    c(4,4) = c44;
    c(5,5) = c44;
    c(6,6) = c44;
    %symmetrize.
    for i = 1:6
        for j = 1:6
            if c(i,j) ~= c(j,i)
                c(j,i) = c(i,j);
            end
        end
    end
else
    %%  nonsymbolic input.
    c   = zeros(6,6);
    c(1,1) = c11;
    c(2,2) = c11;
    c(3,3) = c11;
    c(1,2) = c12;
    c(1,3) = c12;
    c(2,3) = c12;
    c(4,4) = c44;
    c(5,5) = c44;
    c(6,6) = c44;
    %symmetrize.
    for i = 1:6
        for j = 1:6
            v       = [c(i,j),c(j,i)];
            [~,ind] = max(abs(v));
            c(i,j) = v(ind);
        end
    end
end




