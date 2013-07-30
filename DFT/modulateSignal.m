function [ modulatedSignal ] = modulateSignal( t, signal )
% adds modulation to a signal
%   Detailed explanation goes here

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% PARAMETERS %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%

modFrequency = 1e3; % Hz
modPhase = 5; % rad
degreeOfModulation = .5; % [0,1]

modSignal = degreeOfModulation*sin(2*pi*modFrequency*t+modPhase);

modulatedSignal = signal.*(1+modSignal);

end

