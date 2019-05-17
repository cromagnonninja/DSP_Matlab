b=[1 -1];
a=[1 -0.9];
x1=[1 2 3 4];
x2=[1 2 1 0];
y1=filter(b,a,x1);
y2=filter(b,a,x2);
x3=x1+x2;
y3=filter(b,a,x3);
subplot(2,1,1);
stem(y3);
xlabel('sample space');
ylabel('Amplitude');
title('Linearity of Signal-1 by Using D.E');
axis([-10 10 0 20]);
grid on;
%%%%%%%%%%%%
y4=y1+y2;
subplot(2,1,2);
stem(y4,'k');
xlabel('sample space');
ylabel('Amplitude');
title('Linearity of Signal 2 by Using D.E');
axis([-10 10 0 20]);
grid on;
%%%%%%%%%%%%%
if (isequal(y3,y4)==0)
disp('Non linear');
else
disp('Linear');
end