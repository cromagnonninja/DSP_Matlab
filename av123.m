for i = 3:1:50
tic;
data = 1:2^i;
dcDFT(data);
var3(i) = toc;
end
plot(var3);