% ------------------------------------------------------
% Time and Frequency Domain Signal Analysis
% Author: Gideon Odutayo
% License: MIT
% Repository: https://github.com/Giddywiddit/TimeFrequencyDomainAnalysis
%
% Description:
% Master script that runs all analysis stages:
% 1. Time-domain signal generation
% 2. Phase-shift demonstration
% 3. Frequency-domain FFT analysis
% 4. Spectrum analyzer (interactive)
% ------------------------------------------------------

clear; clc; close all;

fprintf('Running EE202 Time and Frequency Domain Analysis...\n');

% Ensure plots directory exists
if ~exist('../plots', 'dir')
    mkdir('../plots');
end

% Step 1: Generate composite signal (time domain)
fprintf('Step 1: Generating time-domain signal...\n');
time_domain_signal;

% Step 2: Apply and visualize phase shift
fprintf('Step 2: Demonstrating phase shift...\n');
phase_shift_demo;

% Step 3: Perform FFT analysis
fprintf('Step 3: Performing frequency-domain analysis...\n');
[f, magX] = frequency_domain_fft;

% Step 4: Launch interactive spectrum analyzer
try
    spectrum_analyzer(f, magX);
catch ME
    fprintf('Spectrum analyzer skipped: %s\n', ME.message);
end

fprintf('\nAll analyses complete. Plots saved in /plots folder.\n');
