function [f,  magX] = frequency_domain_fft()
% ------------------------------------------------------
% Script: frequency_domain_fft.m
% Purpose: Compute and visualize FFT of the composite signal.
% ------------------------------------------------------

A1 = 15; A2 = 17;
f1 = 770; f2 = 785;
phi1 = deg2rad(27);
phi2 = deg2rad(1);
Fs = 8000; T = 1;
t = 0:1/Fs:T-(1/Fs);

x = A1*sin(2*pi*f1*t + phi1) + A2*sin(2*pi*f2*t + phi2);

N = length(x);
X = fft(x);
f = (0:N-1)*(Fs/N);
magX = abs(X);
magX = magX ./ max(magX);  % normalize 0..1

figure('Color', 'w');
plot(f, magX, 'k', 'LineWidth', 1.2);
xlim([0 Fs/2]);
xlabel('Frequency (Hz)', 'FontWeight', 'bold');
ylabel('Normalized Magnitude', 'FontWeight', 'bold');
title('Frequency Spectrum');
grid on;

outPath1 = '../plots/frequency_spectrum.png';
if exist('exportgraphics','file'); exportgraphics(gcf, outPath1, 'Resolution', 300); else; saveas(gcf, outPath1); end

figure('Color', 'w');
plot(f, magX, 'm', 'LineWidth', 1.3);
xlim([760 795]);
xlabel('Frequency (Hz)', 'FontWeight', 'bold');
ylabel('Normalized Magnitude', 'FontWeight', 'bold');
title('Zoomed Spectrum (760–795 Hz)');
grid on;

outPath2 = '../plots/frequency_zoomed.png';
if exist('exportgraphics','file'); exportgraphics(gcf, outPath2, 'Resolution', 300); else; saveas(gcf, outPath2); end
