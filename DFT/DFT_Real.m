function [ re ] = DFT_Real( Y, N )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

re = zeros(N,1);

for n = 1:N
    re(n) = real(sum(Y(n,:)));
end