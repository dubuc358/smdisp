%--------------------FULL TENSOR TO VOIGT INDEX CONVERTER-----------------%


%DESCRIPTION
%- Converts a subscript from voigt notation to the full elastic moduli
%tensor form.

%NOTES
%- The mapping is:
%   1 : (1,1)      
%   2 : (2,2)      
%   3 : (3,3)      
%   4 : (2,3),(3,2)
%   5 : (1,3),(3,1)
%   6 : (1,2),(2,1)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [i,j] = ind_v2f(k)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% k     : subscript in voigt notation.

% i,j   : subscript pair in the full elastic moduli tensor.
%           -for k=4,5, or 6, there are two pairs of i,j that are mapped.
%           in this case, i and j are 2x1 vectors.

%%  CONVERT INDICES

if k == 1 || k == 2 || k == 3
    i   = k;
    j   = k;
elseif k == 4
    i   = [2;3];
    j   = [3;2];
elseif k == 5
    i   = [1;3];
    j   = [3;1];
elseif k == 6
    i   = [1;2];
    j   = [2;1];
end




