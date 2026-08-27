function    plotvgroup(f_lim,c_l,f_m,ce_m)

[~,N_m] = size(f_m);

figure
hold on; box on
xlim(1e-3*[0,f_lim])
ylim([0,c_l])
for i = 1:N_m
    plot(1e-3*f_m(:,i),ce_m(:,i),'k.')
end
xlabel('Frequency [kHz]')
ylabel('Group Velocity [m/s]')
hold off
drawnow