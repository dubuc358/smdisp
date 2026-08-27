%--------------------FULL TENSOR TO VOIGT INDEX CONVERTER-----------------%


%DESCRIPTION
%- Converts a subscript pair from the full elastic moduli tensor to the
%voigt index form.

%NOTES
%- The mapping is:
%   (1,1)       : 1
%   (2,2)       : 2
%   (3,3)       : 3
%   (2,3),(3,2) : 4
%   (1,3),(3,1) : 5
%   (1,2),(2,1) : 6


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [k] = ind_f2v(i,j)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% i,j   : subscript pair in the full elastic moduli tensor.


% k     : subscript in voigt notation.

%%  CONVERT INDICES


if i == j
    k   = i;
elseif i ~= j
    if sort([i,j]) == [2,3]
        k   = 4;
    elseif sort([i,j]) == [1,3]
        k   = 5;
    elseif sort([i,j]) == [1,2]
        k   = 6;
    end
end


