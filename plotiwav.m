function    plotiwav(w_lim,k_lim,w_m,k_m)

[~,N_m] = size(w_m);

figure
hold on; box on
xlim([0,w_lim])
ylim([0,k_lim])
for i = 1:N_m
    plot(w_m(:,i),imag(k_m(:,i)),'k.')
end
xlabel('Angular Frequency [rad/s]')
ylabel('Imaginary Wavenumber [rad/m]')
hold off
drawnow