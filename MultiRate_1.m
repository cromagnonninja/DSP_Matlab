t = -1:0.001:1;
f = 2000;
x = sin(2*3.14*f*t);
fs = 8000; 
xs = sin(2*3.14*(f/fs)*t);
%subplot(2,1,1);
%plot(t,x);
%subplot(2,1,2);
%plot(t,xs);

x1 = [1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10];
y = downsample(x1,10);
subplot(2,1,1);
stem(x1);
subplot(2,1,2);
stem(y);
y
