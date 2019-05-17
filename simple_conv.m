function [C] = simple_conv(f, g)

F = [f,zeros(1,length(g))]; 
G = [g,zeros(1,length(f))];

for i=1:length(g)+length(f)-1 
    C(i) = 0; 

for j=1:length(f) 
    if(i-j+1>0) 
        C(i) = C(i) + F(j) * G(i-j+1); 
    else 
    end 
end 
end
% Show C vector on screen 
end