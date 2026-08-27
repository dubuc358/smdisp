function    plotvphase(f_lim,c_l,f_m,cp_m)

[~,N_m] = size(f_m);

figure
hold on; box on
xlim(1e-3*[0,f_lim])
ylim(2*[0,c_l])
for i = 1:N_m
    plot(1e-3*f_m(:,i),cp_m(:,i),'k.')
end
xlabel('Frequency [kHz]')
ylabel('Phase Velocity [m/s]')
hold off
drawnow