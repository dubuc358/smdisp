%----------------------SECOND ORDER ELASTIC MODULI------------------------%


%DESCRIPTION
%- Converts the second order elastic moduli tensor to voigt notation.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [cv] = c22cv(c2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% c2    : fourth rank elastic moduli tensor.


% cv    : 6x6 elastic moduli matrix, following voigt notation.

%%  CREATE TENSOR

cv  = zeros(6,6);
for i = 1:6
    for j = 1:6
        %generate full indices.
        [i_f,j_f] = ind_v2f(i);
        [k_f,l_f] = ind_v2f(j);
        i_f     = i_f(1);
        j_f     = j_f(1);
        k_f     = k_f(1);
        l_f     = l_f(1);
        %store moduli.
        cv(i,j) = c2(i_f,j_f,k_f,l_f);
    end
end







