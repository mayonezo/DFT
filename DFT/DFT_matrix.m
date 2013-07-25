function [ Y ] = DFT_matrix( y, pointsToCalculate, samplingPoints )
% Creates a matrix with the complex factors of a DFT

Y = zeros(pointsToCalculate,pointsToCalculate);

for k = 1:pointsToCalculate
    for n = 1:pointsToCalculate
        Y(k,n) = y(n)*exp(-1j*2*pi*(k-1)*(n-1)/pointsToCalculate);
    end
end

Y = Y./samplingPoints;

end

