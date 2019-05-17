function [Xk] = dft_1(xn,N)
%To compute the dft of the sequence x(n)
L = length(xn);
%Check for the length of the DFT
if(N>=L)
x1 = [xn zeros(1,N-L)];%Zero padding to the input sequence and assigning the value to the other vector
else 
x1 = xn;    
end
%Twiddle factors
for n=0:1:N-1
for k=0:1:N-1
    p = exp(2*pi*-1j*n*k/N);
    x2(k+1,n+1) = p;
end
end
Xk = x1*x2;
