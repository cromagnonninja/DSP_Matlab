M = 4; 
w = linspace(-2*pi,2*pi,800);
X_dtft = (sin(w*M/2) ./ sin(w/2)) .* exp(-1j * w * (M-1)/2);
figure(1);
plot(w,abs(X_dtft));
figure(2);
plot(w,angle(X_dtft));

