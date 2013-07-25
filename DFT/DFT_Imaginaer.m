function [ im ] = DFT_Imaginaer( Y, N )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

im = zeros(N,1);

for n = 1:N
    im(n) = imag(sum(Y(n,:)));
end