function overlap_add(x,h,L)
N1 = length(x);
M = length(h);
x = [x zeros(1,mod(-N1,L))];
N2 = length(x);
h = [h zeros(1,L-1)];
S = N2/L;
index=1:L;
X=[zeros(M-1)];
for stage=1:S
    xm = [x(index) zeros(1,M-1)];		% Selecting sequence to process
    Y = simple_conv(xm,h); 
    Z = X((length(X)-M+2):length(X))+Y(1:M-1);	%Samples Added in every stage
    X = [X(1:(stage-1)*L) Z Y(M:M+L-1)];
    index = stage*L+1:(stage+1)*L;
end
i=1:N1+M-1;
X=X(i);
figure()
stem(X);