function    plotwav(w_lim,k_lim,w_m,k_m)

[~,N_m] = size(w_m);

figure
hold on; box on
xlim([0,k_lim])
ylim([0,k_lim])
zlim([0,w_lim])
view(135,30)
for i = 1:N_m
    kr  = abs(real(k_m(:,i)));
    ki  = abs(imag(k_m(:,i)));
    plot3(ki,kr,w_m(:,i),'k.')
end
xlabel('Imag. Wavenum. [rad/m]')
ylabel('Real Wavenum. [rad/m]')
zlabel('Angular Freq. [rad/s]')
hold off
drawnow