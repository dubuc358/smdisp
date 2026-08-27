function    diffcompare

close all
format compact
set(0,'defaultlinemarkersize',4)

%domain.
lx      = 100;
x       = linspace(-1,1,lx).';

%function.
f       = myfunc(x);
df      = mydfunc(x);

%finite diff.
N       = 15;
x_fd    = linspace(-1,1,N).';
h       = x_fd(2)-x_fd(1);
f_fd    = myfunc(x_fd);
col     = [-1,zeros(1,N-1)];
row     = [-1,1,zeros(1,N-2)];
D_fd    = 1/h*toeplitz(col,row);
df_fd   = D_fd*f_fd;

%spectral.
[x_sm,D_sm] = chebdif(N,1);
f_sm    = myfunc(x_sm);
df_sm   = D_sm*f_sm;

figure
hold on
plot(x,f,'b')
plot(x_fd,f_fd,'bo','markerfacecolor','b')
plot(x_sm,f_sm,'ro','markerfacecolor','r')
xlim([-1,1])
ylim([0,1]+0.1*[-1,1])
hold off

figure
hold on
plot(x,df,'b')
plot(x_fd,df_fd,'bo','markerfacecolor','b')
plot(x_sm,df_sm,'ro','markerfacecolor','r')
xlim([-1,1])
ylim(3*[-1,1])
hold off


%%  error.
M       = 100;
N       = 4+(1:M).';
E_fd    = zeros(M,1);
E_sm    = zeros(M,1);
for m = 1:M
    %finite diff.
    x_fd    = linspace(-1,1,N(m)).';
    h       = x_fd(2)-x_fd(1);
    f_fd    = myfunc(x_fd);
    col     = [-1,zeros(1,N(m)-1)];
    row     = [-1,1,zeros(1,N(m)-2)];
    D_fd    = 1/h*toeplitz(col,row);
    df_fd   = D_fd*f_fd;
    %spectral.
    [x_sm,D_sm] = chebdif(N(m),1);
    f_sm    = myfunc(x_sm);
    df_sm   = D_sm*f_sm;
    %true derivatives.
    dft_fd  = mydfunc(x_fd);
    dft_sm  = mydfunc(x_sm);
    %errors.
    E_fd(m) = norm(df_fd-dft_fd)./norm(dft_fd);
    E_sm(m) = norm(df_sm-dft_sm)./norm(dft_sm);
end

figure
hold on
plot(N,E_fd,'b')
plot(N,E_sm,'r')
xlim([0,M])
ylim([10^(-15),10])
set(gca,'xscale','log')
set(gca,'yscale','log')
hold off


