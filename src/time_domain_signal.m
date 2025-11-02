% ------------------------------------------------------
% Script: time_domain_signal.m
% Purpose: Generate and visualize a composite time-domain signal.
% ------------------------------------------------------

% Parameters
A1 = 15; A2 = 17;          % Amplitudes
f1 = 770; f2 = 785;        % Frequencies (Hz)
phi1 = deg2rad(27);        % Phases (radians)
phi2 = deg2rad(1);
Fs = 8000;                 % Sampling frequency (Hz)
T = 1;                     % Signal duration (s)
Ts = 1/Fs;                 % Sampling interval
t = 0:Ts:T-Ts;             % Time vector

% Composite signal
x = A1*sin(2*pi*f1*t + phi1) + A2*sin(2*pi*f2*t + phi2);

% Plot
figure('Color', 'w');
plot(t, x, 'LineWidth', 1.3);
xlabel('Time (s)', 'FontWeight', 'bold');
ylabel('Amplitude', 'FontWeight', 'bold');
title('Time Domain Signal');
grid on;

% Save plot
outPath = '../plots/time_domain.png';
if exist('exportgraphics','file')
    exportgraphics(gcf, outPath, 'Resolution', 300);
else
    saveas(gcf, outPath);
end
