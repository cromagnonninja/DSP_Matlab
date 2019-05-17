N=1000;
noise_power = 5.0;
signal_power = 5.0;
h=[1 2 3 2 1];
x=sqrt(signal_power).*randn(1,N);
corr_xx=xcorr(x);
for i=0:4
for j=0:4
R_xx(i+1,j+1)= corr_xx(N+i-j);
end
end
%generate the desired output plus noise
d=conv(x,h);
d=d(1:N)+sqrt(noise_power).*randn(1,N);
%generate R_dx
corr_xd = xcorr(d,x);
for i=0:4
R_dx(i+1) = corr_xd(N-i);
end
%compute the estimate channel response
W_ls = (R_dx)/R_xx