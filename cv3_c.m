%------------------------ELASTIC MODULI TENSOR----------------------------%


%DESCRPIPTION
%- Outputs voigt form of the third order elastic moduli tensor.

%NOTES
%- For cubic symmetry.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [c] = cv3_c(c111,c112,c144,c166,c123,c456)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% c111,c112,... : independent voigt elastic constants.


% c             : voigt form of elastic moduli tensor.

%%  VOIGT MATRIX

if strcmp(class([c111,c112,c144,c166,c123,c456]),'sym') == 1
    %%  symbolic input.
    c   = sym(zeros(6,6,6));
    c(1,1,1) = c111;
    c(2,2,2) = c111;
    c(3,3,3) = c111;
    c(1,4,4) = c144;
    c(2,5,5) = c144;
    c(3,6,6) = c144;
    c(1,1,2) = c112;
    c(2,2,3) = c112;
    c(1,3,3) = c112;
    c(1,1,3) = c112;
    c(1,2,2) = c112;
    c(2,3,3) = c112;
    c(1,6,6) = c166;
    c(1,5,5) = c166;
    c(2,4,4) = c166;
    c(3,4,4) = c166;
    c(2,6,6) = c166;
    c(3,5,5) = c166;
    c(1,2,3) = c123;
    c(4,5,6) = c456;
    %symmetrize.
    for i = 1:6
        for j = 1:6
            for k = 1:6
                if c(i,j,k) ~= c(j,i,k)
                    c(j,i,k) = c(i,j,k);
                elseif c(i,j,k) ~= c(i,k,j)
                    c(i,k,j) = c(i,j,k);
                elseif c(i,j,k) ~= c(k,j,i)
                    c(k,j,i) = c(i,j,k);
                elseif c(i,j,k) ~= c(j,k,i)
                    c(j,k,i) = c(i,j,k);
                elseif c(i,j,k) ~= c(k,i,j)
                    c(k,i,j) = c(i,j,k);
                end
            end
        end
    end
else
    %%  nonsymbolic input.
    c   = zeros(6,6,6);
    c(1,1,1) = c111;
    c(2,2,2) = c111;
    c(3,3,3) = c111;
    c(1,4,4) = c144;
    c(2,5,5) = c144;
    c(3,6,6) = c144;
    c(1,1,2) = c112;
    c(2,2,3) = c112;
    c(1,3,3) = c112;
    c(1,1,3) = c112;
    c(1,2,2) = c112;
    c(2,3,3) = c112;
    c(1,6,6) = c166;
    c(1,5,5) = c166;
    c(2,4,4) = c166;
    c(3,4,4) = c166;
    c(2,6,6) = c166;
    c(3,5,5) = c166;
    c(1,2,3) = c123;
    c(4,5,6) = c456;
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
end





