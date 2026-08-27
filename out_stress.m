function    [s1,s2,ds1,ds2] = out_stress(h,x_i,N_c)

%input stress.
syms x real
s1_sym  = 1e6*input('s11 [MPa]: ');
s2_sym  = 1e6*input('s22 [MPa]: ');
%convert to sym if double is entered.
if isa(s1_sym,'double') == 1
    s1_sym  = s1_sym*x^0;
end
if isa(s2_sym,'double') == 1
    s2_sym  = s2_sym*x^0;
end
%stresses and their spatial derivatives.
[s1,s2,ds1,ds2] = stress(s1_sym,s2_sym,h,x_i,N_c);
%plot.
plotstress(s1,s2,x_i)