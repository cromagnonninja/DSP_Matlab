function [X] = dcDFT(x)
 
%dcDFT This function implements the Divide and Conquer Discrete Fourier Transform
 
% input = x of length N (time)
 
% output = X of same length N (frequency)
N = length(x); %find length of input vector
 
%STEP 1
x0 = x(1:2:N); %even components
x1 = x(2:2:N); %odd components 
%STEP 2
X0 = DFT(x0); %calculate X0 once
X1 = DFT(x1); %calculate X1 once
for k = 0:(N/2)-1
    %STEP 3
        W(k+1) = exp(-1j*2*pi*k/N);  %calculate twiddle factor "W"
        X(k+1) = X0(k+1) + W(k+1)*X1(k+1);  %X0 + W*X1
        X(k+1+N/2) = X0(k+1) - W(k+1)*X1(k+1);  %X0 - W*X1
end %end for
end %end dcDFT