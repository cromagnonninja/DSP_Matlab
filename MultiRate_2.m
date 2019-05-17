F = [0, 0.1, 0.46, 1];
A = [0, 1, 0, 0]; 

x = fir2(256,F,A);
figure(1);
plot(x);
X = fft(x,1024);

f = 0:1/1024:(512-1)/1024;
% 0:1/fs:2fm/fs -> Normalised 
figure(2);
subplot(5,1,1);
plot(f,abs(X(1:512)));

M = 2; 
y2 = x(1:M:256);
Y2 = fft(y2,1024);
subplot(5,1,2);
plot(f,abs(Y2(1:512)));

M = 3; 
y3 = x(1:3:256);
Y3 = fft(y3,1024);
subplot(5,1,3);
plot(f,abs(Y3(1:512)));

M = 4; 
y4 = x(1:4:256);
Y4 = fft(y4,1024);
subplot(5,1,4);
plot(f,abs(Y4(1:512)));

d1 = decimate(x,3);
yd = fft(d1,1024);
subplot(5,1,5);
plot(f,abs(yd(1:512)));




