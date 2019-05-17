% 1. For two input signals, perform the circular convolution and the linear
% convolution. Then verify that the output of circular convolution can be 
% Same as linear convolution after zero padding. 

function [c] = EDSP632C_lab3_1(a,b)
c = zeros(length(a) + length(b) - 1);

for i=1:length(a) + length(b) - 1 
    c[i] = a[i] * b[total - i]; 

    