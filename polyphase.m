clc
clear all 
close all
% STEP 1
% Lowpass FIR filter design
h = firpm(59,[0,2*400/10000,1000/5000,1],[1,1,0,0]); % Computation of filter coefficients
[H,F1] = freqz(h,1,1024,10000); % Computation of filter frequency response
figure (1);
subplot(4,1,1); 
plot(F1,20*log10(abs(H))); 
legend('Filter magnitude response'); 
ylabel('Gain, dB');
axis([0,5000,-80,5]);
% STEP 2
% Generating the input signal
n = 0:510; % Time index
x = cos(2*pi*200*n/10000)+cos(2*pi*400*n/10000)+0.7*cos(2*pi*3800*n/10000)+randn(size(n));
[X,F1] = freqz(x,1,1024 ,10000); % Computing the signal spectrum
subplot(4,1,2);
plot(F1,abs(X)); 
legend('Spectrum: input signal'); 
ylabel('|X(F)|'); 
axis([0,5000,0,300]);
% STEP 3
% Polyphase decomposition
E = reshape(h,5,length(h)/5);
% STEP 4
% Polyphase downsampling and filtering
x0 = x(1:5:length(x)); 
x1 = [0,x(5:5:length(x))]; 
x2 = [0,x(4:5:length(x))];
x3 = [0,x(3:5:length(x))]; 
x4 = [0,x(2:5:length(x))];

y0 = filter(E(1,:),1,x0); 
y1 = filter(E(2,:),1,x1); 
y2 = filter(E(3,:),1,x2); 
y3=filter(E(4,:),1,x3);
y4=filter(E(5,:),1,x4);

ydec = y0 + y1 + y2 + y3 + y4; % Decimated signal
[Ydec,F2] = freqz(ydec,1,512 ,2000);

subplot(4,1,3), plot(F2,abs(Ydec));
legend('Spectrum: decimated signal'); 
ylabel('|Y_d_e_c(F)|');
axis([0,1000,0,60])
% STEP 5
x = ydec; % Input to the interpolator
% Poliphase filtering and up-sampling
u0 = 5*filter(E(1,:),1,x); u1 = 5*filter(E(2,:),1,x); u2 = 5*filter(E(3,:),1,x);
u3 = 5*filter(E(4,:),1,x); u4 = 5*filter(E(5,:),1,x);
U = [u0;u1;u2;u3;u4];
yint = U(:); % interpolated signal
[Yint,F3] = freqz(yint,1,1024 ,10000);
subplot(4,1,4), plot(F3,abs(Yint)); 
legend('Spectrum: interpolated signal'); 
xlabel('Frequency, Hz');
ylabel('|Y_i_n_t(F)|');
axis([0,5000,0,300]);