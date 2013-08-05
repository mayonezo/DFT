function [ Y ] = DFT_vector( y, pointsToCalculate, samplingPoints )
% Creates a matrix with the complex factors of a DFT, then sums up the columns

Y_temp = zeros(pointsToCalculate,pointsToCalculate);
Y = 1:pointsToCalculate;

for k = 1:pointsToCalculate
    for n = 1:pointsToCalculate
        Y_temp(k,n) = y(n)*exp(-1j*2*pi*(k-1)*(n-1)/pointsToCalculate);
        Y(n) = sum(Y_temp(n,:));
    end
end

Y = Y./samplingPoints;

end
