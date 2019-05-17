function [num, den] = latticetoFIR(K,V)
K=K(:); V=V(:); 
 
ordiff = length(V)-length(K)-1; 
if ordiff>0 
  K = [K; zeros(ordiff,1)]; 
elseif ordiff<0 
  V = [V; zeros(-ordiff,1)]; 
end 
 
num = V(1); 
den = K(1); 
for m = 2:length(K) 
  bm = conj(den(m-1:-1:1)); 
  den = [den+bm*K(m) K(m)]; 
  num = [V(m)*bm num]; 
end 
den = [1 den]; 