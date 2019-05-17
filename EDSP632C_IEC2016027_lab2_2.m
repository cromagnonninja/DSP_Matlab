% Let x(n) be a 4 point sequence x(n) = [1,1,1,1]
% 1. Find the DTFT X(jw) and plot its magnitude and phase
% 2. Compute the 4 point DFT of x(n) and show the effect of N and L 
% X(k) = sigma 0 to N (4 here) x(n) wn^kn 
% x(n) = sigma 0 to N X(k) wn^-kn 
% wn = e^((-2j*pi)/N)

N = 100;
f = -2*pi:4*pi/(N-1):2*pi; 
a = dft_1([1 1 1 1], N); 
plot(f,abs(a));