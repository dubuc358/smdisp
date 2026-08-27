function    [k,u] = clean(k,u,pow,N)

%remove infinites.
ind     = find(isinf(k) == 0);
k       = k(ind);
u       = u(:,ind);
%ratios.
rat     = abs(real(k))./abs(imag(k));
%%  extract p.
indp    = find(rat > 10^pow);
kp      = k(indp);
up      = u(:,indp);
%reorder p.
[~,ind] = sort(real(kp),'descend');
kp      = kp(ind);
up      = up(:,ind);
%remove doubles.
lp      = length(indp);
if mod(lp,2) == 0
    kp  = kp(1:lp/2);
    up  = up(:,1:lp/2);
elseif mod(lp,2) == 1
    error('Mode grouping difficult. Slightly adjust input parameters if possible.')
end
%%  extract np.
indnp   = find(rat < 10^(-pow));
knp     = k(indnp);
unp     = u(:,indnp);
%reorder np.
[~,ind] = sort(imag(knp),'ascend');
knp     = knp(ind);
unp     = unp(:,ind);
%remove doubles.
lnp     = length(indnp);
if mod(lnp,2) == 0
    knp = knp(lnp/2+1:lnp);
    unp = unp(:,lnp/2+1:lnp);
elseif mod(lnp,2) == 1
    error('Mode grouping difficult. Slightly adjust input parameters if possible.')
end
%%  extract c.
ind1    = find(rat >= 10^(-pow));
ind2    = find(rat <= 10^pow);
indc    = intersect(ind1,ind2);
kc      = k(indc);
uc      = u(:,indc);
%reorder c.
[~,ind] = sort(abs(kc),'ascend');
kc      = kc(ind);
uc      = uc(:,ind);
%remove doubles.
lc      = length(indc);
if mod(lc,4) == 0
    kn  = zeros(lc/4,1);
    un  = zeros(N,lc/4);
    for j = 1:lc/4
        n1      = 1+4*(j-1);
        n2      = n1+3;
        k_j     = kc(n1:n2);
        u_j     = uc(:,n1:n2);
        ind1    = find(real(k_j) >= 0);
        ind2    = find(imag(k_j(ind1)) >= 0);
        kn(j)   = k_j(  ind1(ind2(1)));
        un(:,j) = u_j(:,ind1(ind2(1)));
    end
    kc  = kn;
    uc  = un;
elseif mod(lc,2) == 1
    error('Mode grouping difficult. Slightly adjust input parameters if possible.')
end
%%  rejoin.
%rejoin with np.
knp     = [knp;kc];
unp     = [unp,uc];
[~,ind] = sort(abs(knp),'ascend');
knp     = knp(ind);
unp     = unp(:,ind);
%rejoin all.
k       = [kp;knp];
u       = [up,unp];