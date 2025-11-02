function spectrum_analyzer(f, magX)
% ------------------------------------------------------
% Function: spectrum_analyzer
% Purpose : Interactive spectrum viewer with dB scale and data cursor.
% ------------------------------------------------------

if nargin < 2
    error('Usage: spectrum_analyzer(f, magX)');
end

epsval = 1e-12;
magX_dB = 20*log10(max(magX, epsval));

figure('Color', 'w');
plot(f, magX_dB, 'LineWidth', 1.2);
xlim([0 max(f)/2]);
xlabel('Frequency (Hz)', 'FontWeight', 'bold');
ylabel('Magnitude (dBFS)', 'FontWeight', 'bold');
title('Spectrum Analyzer (dB Scale)');
grid on;

dcm = datacursormode(gcf);
set(dcm, 'UpdateFcn', @(obj,evt)localUpdateFcn(evt));

    function txt = localUpdateFcn(evt)
        pos = get(evt, 'Position');
        txt = {sprintf('f = %.2f Hz', pos(1)), sprintf('Mag = %.2f dBFS', pos(2))};
    end
end
