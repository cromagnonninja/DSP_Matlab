% Study the aliasing of frequency components using MATLAB 
% Let us take a sinusoidal signal with frequency of 550 Hz
% Represent its frequency with sampling frequency 2000 Hz and 1000 Hz 
t = [0:0.001:1]; 
sine1 = sin(2*pi*550*t);
y1 = fft(sine1);
figure(1);
plot(t,y1,'r');

t = [0:0.0005:1];
sine2 = sin(2*pi*550*t);
y2 = fft(sine2);
figure(2);
plot(t,y2,'b');
