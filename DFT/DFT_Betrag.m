function [ A ] = DFT_Betrag( Y, N )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

A = zeros(N,1);

for n = 1:N
    A(n) = abs(sum(Y(n,:)));
end