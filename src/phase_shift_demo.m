% ------------------------------------------------------
% Script: phase_shift_demo.m
% Purpose: Demonstrate the effect of phase shift on the composite signal.
% ------------------------------------------------------

A1 = 15; A2 = 17;
f1 = 770; f2 = 785;
phi1 = deg2rad(27);
phi2 = deg2rad(1 + 90);   % 90° shift on f2
Fs = 8000; T = 1;
t = 0:1/Fs:T-(1/Fs);

x_shifted = A1*sin(2*pi*f1*t + phi1) + A2*sin(2*pi*f2*t + phi2);

figure('Color', 'w');
plot(t, x_shifted, 'LineWidth', 1.3);
xlabel('Time (s)', 'FontWeight', 'bold');
ylabel('Amplitude', 'FontWeight', 'bold');
title('Time Domain Signal with 90° Phase Shift on f_2');
grid on;

outPath = '../plots/time_domain_phase_shift.png';
if exist('exportgraphics','file')
    exportgraphics(gcf, outPath, 'Resolution', 300);
else
    saveas(gcf, outPath);
end
