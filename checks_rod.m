function    checks_rod(N_c)

%collocation points.
if N_c < 3
    error('Number of collocations points must be greater than 2')
end