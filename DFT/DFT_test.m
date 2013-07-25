clear;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% PARAMETERS %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%

% Signal Parameters
signalFrequency = 3906.25; % Hz
signalRunTime = 1e0; % s
signalPower = 23.9794; % dBm, 50 ohm
SNR = -2e1; % dB

% Signal Processing Parameters
samplingPoints = 256;
windowShift = 0e2; % Samples
samplingFrequency = 1e4; % Hz
paddingNum = 1e3; % number of padding values at the beginning AND the end of the signal
paddingValue = 1e-17;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% SIGNAL GENERATION %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Time Vector
t = 0 : 1/samplingFrequency : signalRunTime;

% Signal Power in W
P_S = 10^(signalPower/10)/1000;

% Signal Type
signalAmplitude = sqrt(2*P_S*50);
signal = signalAmplitude*cos(2*pi*signalFrequency*t);

% AWGN
%signal = awgn(signal,SNR, 'measured');

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% CALCULATIONS %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate Signal Power for 50 Ohm
P_S_calculated = rms(signal).^2./50;

% Window Shift
shiftedWindowedSignal = signal(windowShift+1 : windowShift+samplingPoints);

% Zero Padding
shiftedPaddedWindowedSignal = padarray(shiftedWindowedSignal,[0 paddingNum], paddingValue);
pointsToCalculate = length(shiftedPaddedWindowedSignal);

% Create DFT-Matrix
Y = DFT_matrix(shiftedPaddedWindowedSignal, pointsToCalculate, samplingPoints);

% Re, Im, Abs, Phase, Spectral Density
rePart = DFT_Real(Y, pointsToCalculate);
rePart = [rePart(pointsToCalculate/2+2:pointsToCalculate) ; rePart(1:pointsToCalculate/2+1)];

imPart = DFT_Imaginaer(Y, pointsToCalculate);
imPart = [imPart(pointsToCalculate/2+2:pointsToCalculate) ; imPart(1:pointsToCalculate/2+1)];

A = DFT_Betrag(Y, pointsToCalculate);
A = [A(pointsToCalculate/2+2:pointsToCalculate) ; A(1:pointsToCalculate/2+1)];

phi = DFT_Phase(Y, pointsToCalculate);
phi = [phi(pointsToCalculate/2+2:pointsToCalculate) ; phi(1:pointsToCalculate/2+1)];

spectralDensity = A.^2./50;

%%%%%%%%%%%%%%%%%%%
%%%%%% PLOTS %%%%%%
%%%%%%%%%%%%%%%%%%%

f_full = (samplingFrequency/2)*linspace(-1,1,pointsToCalculate);
f_pos = (samplingFrequency/2)*linspace(0,1,pointsToCalculate/2+1);

figure(1);
h = zoom;
set(h,'Motion','horizontal','Enable','on');

subplot(3,2,1);
plot(t,signal,'-');
title('Signal');
xlabel('t [s]');
ylabel('U [V]');
legend('Signal');

subplot(3,2,2);
plot(f_pos, 2*spectralDensity(pointsToCalculate/2 : pointsToCalculate),'-o');
title('Leistungsdichte');
xlabel('f');
ylabel('P');
legend('Leistungsdichte');

subplot(3,2,3);
plot(f_full, rePart,'-o');
title('Realteil');
xlabel('f');
ylabel('Re');
legend('Realteil');

subplot(3,2,4);
plot(f_full, imPart,'-o');
title('Imaginärteil');
xlabel('f');
ylabel('Im');
legend('Imaginärteil');

subplot(3,2,5);
plot(f_full, A,'-o');
title('Betragsspektrum');
xlabel('f');
ylabel('|Y|');
legend('Betrag');

subplot(3,2,6);
plot(f_full, phi,'-o');
title('Phasenspektrum');
xlabel('f');
ylabel('Phi');
legend('Phase');