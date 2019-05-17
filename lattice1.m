function [y] = lattice1(K,x)
Nx = length(x) - 1; 
x = K(1)*x; 
M = length(K)-1; 
K = K(2:M+1);
fg = [x; [0 x(1:Nx)]];
for m=1:M 
    fg = [1,K(m);K(m),1]*fg;
    fg(2,:) = [0 fg(2,1:Nx)];
end
y = fg(1,:);