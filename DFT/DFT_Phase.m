function [ phi ] = DFT_Phase( Y, N )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

phi = zeros(N,1);

for n = 1:N
    phi(n) = angle(sum(Y(n,:)));
end