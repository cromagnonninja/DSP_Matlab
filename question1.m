var1 = [];
var2 = [];
var3 = [];

for i = 10:1:300
tic;
fft(data,i);
var1(i) = toc;    
end
plot(var1);

for i = 10:1:300
data = 1:i;
tic; 
DFT(data);
var2(i) = toc;
end 
hold on;
plot(var2);


for i = 1:1:300
data = 1:i;
tic; 
DFT(data);
var3(i) = 2*toc;
end 
hold on;
plot(var3);
