N = 100; 
n = 0:N-1; 
s = sqrt(2)*sin(2*pi*n/12);
% x = sqrt(2)*sin(2*pi*(n-1)/12);
% corr_x = zeros();
% for i=1:N 
%     corr_x(i) = 
% corr_x_d = xcorr2(transpose(x),s);
% wls = corr_x_d/corr_x;
% wls
x = zeros(size(s));
shift = 1; 
if shift >0
  x(shift+1:end) = s(1:end-shift);
elseif shift <0
  x(1:end+shift) = s(-shift+1:end);
end
d = s; 
Rxx = toeplitz(xcorr(x));
Rdx = xcorr2(s,x);

w = Rdx/Rxx