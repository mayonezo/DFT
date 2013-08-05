function [ signal, t ] = generateSignal(samplingFrequency)
% Generates a signal
%   Detailed explanation goes here


%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% PARAMETERS %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%

% Signal Parameters
signalFrequency = 2.5e9; % Hz
signalPhase = 5; % rad
signalRunTime = 1e-4; % s
signalPower = 23.9794; % dBm, 50 ohm
SNR = 2e1; % dB

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% SIGNAL GENERATION %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Time Vector
t = 0 : 1/samplingFrequency : signalRunTime;

% Signal Power in W
P_S = 10^(signalPower/10)/1000;

% Signal Type
signalAmplitude = sqrt(2*P_S*50);
signal = signalAmplitude*cos(2*pi*signalFrequency*t+signalPhase);
%signal = signalAmplitude*sawtooth(2*pi*signalFrequency*t);
%signal = signalAmplitude*square(2*pi*signalFrequency*t);
%signal = signalAmplitude*gauspuls(t, signalFrequency, 1.2);
%signal = signalAmplitude*chirp(t,0,t(end),signalFrequency);

% Calculate Signal Power for 50 Ohm
%P_S_calculated = rms(signal).^2./50;

% AWGN
%signal = awgn(signal, SNR, 'measured');

end
