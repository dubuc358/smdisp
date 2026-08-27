%--------------------GENERALIZED KRONECKER DELTA--------------------------%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [d] = kd(m,n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% m     : 1xL vector of integers.
%
% n     : 1xL vector of integers.


% d = delta_m^n
%
% if the list of m is an even permutation of n, then d = 1.
% if the list of m is an odd  permutation of n, then d = 1.
% else d = 0.
%
% for L=1, the regular kronecker delta is retrieved.

%%  INITIALIZE

L   = length(m);
if L ~= length(n)
    error('m and n must be the same length')
end

%%  COMPUTE

Md  = zeros(L,L);
for i_n = 1:L
    for i_m = 1:L
        Md(i_n,i_m) = (n(i_n)==m(i_m));
    end
end
d   = det(Md);










