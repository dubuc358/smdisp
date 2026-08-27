%----------------------SECOND ORDER ELASTIC MODULI------------------------%


%DESCRIPTION
%- Converts the second order elastic moduli tensor in voigt notation into
%the full fourth rank tensor.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [c] = cv2c2(cv)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% cv    : 6x6 elastic moduli matrix, following voigt notation.


% c     : fourth rank elastic moduli tensor.

%%  CREATE TENSOR

if strcmp(class(cv),'sym') == 1
    c   = sym(zeros(3,3,3,3));
else
    c   = zeros(3,3,3,3);
end
for i = 1:3
    for j = 1:3
        for k = 1:3
            for l = 1:3
                %generate voigt indices.
                i_v = ind_f2v(i,j);
                j_v = ind_f2v(k,l);
                %store moduli.
                c(i,j,k,l) = cv(i_v,j_v);
            end
        end
    end
end







