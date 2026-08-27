%-----------------------THIRD ORDER ELASTIC MODULI------------------------%


%DESCRIPTION
%- Converts the third order elastic moduli tensor to voigt notation.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [cv] = c32cv(c3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% c3    : sixth rank elastic moduli tensor.


% cv    : 6x6x6 elastic moduli matrix, following voigt notation.

%%  CREATE TENSOR

cv  = zeros(6,6,6);
for i = 1:6
    for j = 1:6
        for k = 1:6
            %generate full indices.
            [i_f,j_f] = ind_v2f(i);
            [k_f,l_f] = ind_v2f(j);
            [m_f,n_f] = ind_v2f(k);
            i_f     = i_f(1);
            j_f     = j_f(1);
            k_f     = k_f(1);
            l_f     = l_f(1);
            m_f     = m_f(1);
            n_f     = n_f(1);
            %store moduli.
            cv(i,j,k) = c3(i_f,j_f,k_f,l_f,m_f,n_f);
        end
    end
end







