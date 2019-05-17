function [num, den] = LATC2TF(K,V)
if isempty(K) || ((nargin>1) && ~isstr(V) && isempty(V)) 
  num=[]; den=[]; return 
end 
% Parse input args: 
if nargin>1 
  if isstr(V)  %#ok<*DISSTR>
    switch(lower(V)) 
    case 'iir' 
      lattice_type = 1;  % IIR 
      V=1;               % Default ladder coeff 
    case 'fir' 
      lattice_type = 0;  % FIR 
    otherwise 
      error('Lattice type must be ''fir'' or ''iir''.'); 
    end 
  else 
    lattice_type = 1;    % IIR 
  end 
else 
  lattice_type = 0;      % FIR 
end 
 
% Handle FIR case: 
if lattice_type == 0, 
  num = rc2poly(K); 
  den = 1; 
  return; 
end 
 
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