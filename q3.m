x1 = [];
x2 = [];
time = [];
time1 = [];

for k=1:1000
    x1 = 1:k;
    x2 = 1:k;
    tic;
    simple_conv(x1,x2);
    time(k) = toc;
end
plot(time);
legend('Linear');
hold on;

for k = 1:1000
    x1_1 = 1:k;
    x2_2 = 1:k;
    tic;
    X1 = fft(x1_1);
    X2 = fft(x2_2);
    Y = X1.*X2;
    y = ifft(Y);
    time1(k) = toc; 
end
plot(time1);