n0 = 1;                 %delay
n = 0:0.1:1;
x0 = cos(n); 
x1 = [zeros(1,n0) cos(n)]%delaying the input
y1 = 2.5*x1;
x2 = cos(n)
y2 = [zeros(1,n0) 2.5*x2]%delaying the ouput
subplot(2,1,1)
stem(1:length(n) + 1,y1)
title('DELAYED INPUT')
subplot(2,1,2)
stem(1:length(n) + 1,y2)
title('DELAYED OUTPUT')