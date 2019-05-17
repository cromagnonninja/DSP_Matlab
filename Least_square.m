N = 50000;
n = 0:N-1;
d = sin(2*pi*n./12);
x = d(2:N);
d = d(1:N-1);
corr_x = xcorr(x,'unbiased');
for i=0:4
    for j=0:4
        R_xx(i+1,j+1) = corr_x(N-1+i-j);
    end
end
corr_x_d = xcorr(d,x,'unbiased');
for i=0:4
    R_dx(i+1) = corr_x_d(N-1-i);
end
W_ls = R_dx/R_xx; 