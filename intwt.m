%-------------------------------------------------------------------------%


%DESCRIPTION
%- Quadrature weights.

%NOTES
%- For integration over a bounded interval.
%- From Boyd2000.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [w] = intwt(N)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% N     : number of sample points.


% w     : vector of weights.

%%  WEIGHTS

i   = (1:N).';
t   = pi/(N+1)*i;
w   = zeros(N,1);
for j = 1:N
    t_j     = t(j);
    for m = 1:N
        w(j)    = w(j)+sin(m*t_j)*(1-cos(m*pi))/m;
    end
    w(j)    = w(j)*2/(N+1)*sin(t_j);
end