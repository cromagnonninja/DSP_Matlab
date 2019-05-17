F = [0, 0.2, 0.9, 1];
A = [0, 1, 0, 0]; 

x = fir2(128,F,A);
X = fft(x,1024);
f = 0:1/1024:(512-1)/1024;
subplot(3,1,1);
plot(f,abs(X(1:512)));

M = 4; 
y2 = zeros(1,M*length(x));
y2(1:M:length(y2)) = x;
Y2 = fft(y2,1024);
subplot(3,1,2);
plot(f,abs(Y2(1:512)));

y_inter = interp(x,M);
Y = fft(y_inter,1024);
subplot(3,1,3);
plot(f,abs(Y(1:512)));