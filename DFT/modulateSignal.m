function [ modulatedSignal ] = modulateSignal( t, signal )
% adds modulation to a signal
%   Detailed explanation goes here

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% PARAMETERS %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%

modFrequency = 400e6; % Hz
modPhase = 5; % rad
modulationIndex = 0.5; % [0,1]

modSignal = modulationIndex*sin(2*pi*modFrequency*t+modPhase);

modulatedSignal = signal.*(1+modSignal);

end