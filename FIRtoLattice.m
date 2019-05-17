% 1. Write a general MATLAB programme to convert FIR direct form coefficients
% into Lattice structures 
% 2. Write a program to realise a Lattice structure 
% 3. Write a program to convert Lattice structure into direct form
% FIR structure coefficients 

function [K,V]=FIRtoLattice(num,den)  
if isempty(num) || ( (nargin>1) && isempty(den) ) 
  K=[]; V=[]; return 
end 
num = num(:);     
 
if nargin==2
  den = den(:);     
  if length(den)<2  
    K = 0;     
    V = num;   
    return 
  end 
 
  ordiff = length(den)-length(num); 
  if ordiff>=0
    num = [num;zeros(ordiff,1)]; 
  else 
    den = [den;zeros(-ordiff,1)]; 
  end 
  M = length(den)-1; 
 
  Am = den; 
  Cm = num; 
  for m=M:-1:1
    K(m) = Am(end); 
    V(m) = Cm(end); 
    if abs(K(m))>=1
      error('The IIR system is unstable.'); 
    end  
    Bm = conj(Am(end:-1:1)); 
    Cmm1 = Cm - V(m)*Bm; 
    Amm1 = (Am - K(m)*Bm) / ( 1 - K(m)*conj(K(m)) ); 
    Am = Amm1(1:end-1); 
    Cm = Cmm1(1:end-1); 
  end  
  V=[Cm;V(:)];  % Grab last ladder coeff 
  K=K(:); 
 
else  
  if length(num)==1
    K=0; 
  else  
    M = length(num)-1; 
    Am = num./num(1); 
    for m=M:-1:1 
      K(m) = Am(end); 
      if m==1, break; end  
      if abs(K(m))==1 
        error('The FIR system has a zero on the unit circle.'); 
      end
      Bm = conj(Am(end:-1:1)); 
      Amm1 = (Am - K(m)*Bm) / (1 - K(m)*conj(K(m)));  
      Am = Amm1(1:end-1); 
    end  
    K=K(:); 
  end 
end 