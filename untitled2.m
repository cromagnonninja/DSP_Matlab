%   TF2LATC Transfer function to lattice filter conversion. 
%   [K,V] = TF2LATC(NUM,DEN) finds the lattice parameters K and the ladder 
%   parameters V for an IIR (ARMA) lattice-ladder filter, normalized by 
%   DEN(1).  Note that an error will be generated if any poles of the 
%   transfer function lie on the unit circle. 
% 
%   K = TF2LATC(1,DEN) finds the lattice parameters K for an IIR 
%   all-pole (AR) lattice filter.  [K,V] = TF2LATC(1,DEN) returns 
%   a scalar ladder coefficient V. 
% 
%   K = TF2LATC(NUM) finds the lattice parameters K for an FIR (MA) 
%   lattice filter, normalized by NUM(1). 
% 
%   See also LATC2TF, LATCFILT. 
 
% Reference: J.G. Proakis, D.G. Manolakis, Digital Signal Processing, 
%            3rd ed., Prentice Hall, N.J., 1996, Chapter 7. 
% 
%   Author(s): D. Orofino, 5-6-96 
%   Copyright (c) 1988-98 by The MathWorks, Inc. 
%   $Revision: 1.5 $  $Date: 1997/11/26 20:12:52 $ 
 
% Convert an all-pole IIR model to lattice coefficients: 
%            DEN = [1 13/24 5/8 1/3]; 
%            K = tf2latc(1,DEN);  % K will be [1/4 1/2 1/3]' 
% 
