function    checks(N_c,phi)

%collocation points.
if N_c < 3
    error('Number of collocations points must be greater than 2')
end
%propagation direction.
if mod(phi,90) ~= 0
    error('Propagation direction must be an integer multiple of 90 deg')
end