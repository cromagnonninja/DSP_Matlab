% Lowpass Filter Design 
% gives N+1 = 60 coefficients in this case 
h = firpm(59,[0,2*400/10000,1000/5000,1],[1,1,0,0]);
n = [];
M = 2;
%for polyphase filter we use reshape() 
E = reshape(h,M,length(h)/M);
x = cos(2*pi*(200/10000)*n) + cos(2*pi*(400/10000)*n) +0.7*cos(2*pi*(3800/10000)*n) + randn(size(n));