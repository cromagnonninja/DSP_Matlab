% Let x(n) be a 4 point sequence x(n) = [1,1,1,1]
% 1. Find the DTFT X(jw) and plot its magnitude and phase
% 2. Compute the 4 point DFT of x(n) and show the effect of N and L 
% X(k) = sigma 0 to N (4 here) x(n) wn^kn 
% x(n) = sigma 0 to N X(k) wn^-kn 
% wn = e^((-2j*pi)/N)

function [Xk] = dft1(xn,N)
    n = 0:1:N-1;
    k = 0:1:N-1;
    wN = exp(-1j*2*pi/N);
    nk = n'*k; 
    wnk = wN^nk;
    Xk = xn * wnk;
end

