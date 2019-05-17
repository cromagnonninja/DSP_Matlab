% For an input sequence of length 1 to 2048, compare the time execution
% time for Divide and Conquer, DFT and FFT algorithm
function [X] = DFT(x)
N = length(x);
X(N) = 0; %initialize zero vector X(k)
for k = 1:N
    for n = 1:N 
        X(k) = X(k) + x(n)*exp(-1j*2*pi*(k-1)*(n-1)/N);
    end %end for
end %end for
end 