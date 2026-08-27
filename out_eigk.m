function    [w,u] = out_eigk(L,M,N_m)

[u,w2]  = eig(L,M,'vector');%solve eigenvalue problem.
[w,ind] = sort(real(sqrt(w2)));%sort frequency.
u       = u(:,ind);%sort mode shape.
%remove false solutions.
indinf  = find(isinf(w) == 0);%remove infinite entries.
indz    = find(w);%remove zeroes.
ind     = intersect(indinf,indz);
w       = w(ind(1:N_m));
u       = u(:,ind(1:N_m));