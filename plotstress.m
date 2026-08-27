%-------------------------------------------------------------------------%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    plotstress(s1,s2,x_i)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n       = length(x_i);
col     = 'k';
%convert to mpa.
s1      = 1e-6*s1;
s2      = 1e-6*s2;
%limits.
dx      = max([s1;s2;0])-min([s1;s2;0]);
x_min   = min([s1;s2])-dx/10;
x_max   = max([s1;s2])+dx/10;
if x_min > 0 && x_max > 0
    x_min   = -dx/10;
elseif x_min < 0 && x_max < 0
    x_max   = +dx/10;
end
if x_min == x_max
    x_min   = x_min-1;
    x_max   = x_max+1;
end
%%  plot.
figure
subplot(1,2,1)
hold on; box on
xlim([x_min,x_max])
ylim([-1.1,1.1])
%plots.
plot([x_min,x_max],[-1,-1],'k','linew',2)
plot([x_min,x_max],[1,1],'k','linew',2)
plot([0,0],[-1,1],'k:','linew',1)
plot([x_min,x_max],[0,0],'k:','linew',1)
for i = 1:n
    quiver(0,x_i(i),s1(i),0,col,'autoscale','off','maxheadsize',0)
end
x_f     = linspace(1,-1).';
s1_f    = chebint(s1,x_f);
plot(s1_f,x_f,col,'linew',1.5)
plot(s1,x_i,[col,'.'],'markersize',12)
%labels.
xlabel('Stress s_{11} [MPa]')
ylabel('Plate Cross-Section [-]')
hold off
subplot(1,2,2)
hold on; box on
xlim([x_min,x_max])
ylim([-1.1,1.1])
%plots.
plot([x_min,x_max],[-1,-1],'k','linew',2)
plot([x_min,x_max],[1,1],'k','linew',2)
plot([0,0],[-1,1],'k:','linew',1)
plot([x_min,x_max],[0,0],'k:','linew',1)
for i = 1:n
    quiver(0,x_i(i),s2(i),0,col,'autoscale','off','maxheadsize',0)
end
s2_f    = chebint(s2,x_f);
plot(s2_f,x_f,col,'linew',1.5)
plot(s2,x_i,[col,'.'],'markersize',12)
%labels.
xlabel('Stress s_{22} [MPa]')
hold off
drawnow