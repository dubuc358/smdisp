%-------------------------------------------------------------------------%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [s1,s2,ds1,ds2] = stress(s1_sym,s2_sym,h,x_i,N)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms x real%symbolic through thickness variable.
%%  x_1 stress.
%x_1 normal stress.
s1      = matlabFunction(s1_sym);
if nargin(s1) == 0
    s1      = s1()*ones(N,1);
else
    s1      = s1(x_i);
end
%x_1 normal stress derivative.
ds1_sym = 1/h*diff(s1_sym,x);
ds1     = matlabFunction(ds1_sym);
if nargin(ds1) == 0
    ds1     = ds1()*ones(N,1);
else
    ds1     = ds1(x_i);
end
%%  x_2 stress.
%x_2 normal stress.
s2      = matlabFunction(s2_sym);
if nargin(s2) == 0
    s2      = s2()*ones(N,1);
else
    s2      = s2(x_i);
end
%x_2 normal stress derivative.
ds2_sym = 1/h*diff(s2_sym,x);
ds2     = matlabFunction(ds2_sym);
if nargin(ds2) == 0
    ds2     = ds2()*ones(N,1);
else
    ds2     = ds2(x_i);
end