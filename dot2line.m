function    [wn,kn,un] = dot2line(w,k,u)


[N,~,L,M] = size(u);

wn      = zeros(L,M);
kn      = zeros(L,M);
un      = zeros(N,3,L,M);
for m = 1:M
    for i = 1:L
        if i == 1
            [w1,n]  = min(w(i,:));
            w(i,n)  = NaN;
            wn(i,m) = w1;
            kn(i,m) = k(i,n);
            for j = 1:3
                un(:,j,i,m) = u(:,j,i,n);
            end
        elseif i == 2
            [~,n]   = min(abs(w1-w(i,:)));
            w2      = w(i,n);
            w(i,n)  = NaN;
            wn(i,m) = w2;
            kn(i,m) = k(i,n);
            for j = 1:3
                un(:,j,i,m) = u(:,j,i,n);
            end
        elseif i == 3
            [~,n]   = min(abs(w2-w(i,:)));
            w3      = w(i,n);
            w(i,n)  = NaN;
            wn(i,m) = w3;
            kn(i,m) = k(i,n);
            for j = 1:3
                un(:,j,i,m) = u(:,j,i,n);
            end
        else
            we      = extrap(kn(i-3:i-1,m),wn(i-3:i-1,m),k(i,1));
            [~,n]   = min(abs(we-w(i,:)));
            wi      = w(i,n);
            w(i,n)  = NaN;
            wn(i,m) = wi;
            kn(i,m) = k(i,n);
            for j = 1:3
                un(:,j,i,m) = u(:,j,i,n);
            end
        end
    end
end