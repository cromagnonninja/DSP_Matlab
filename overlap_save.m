function overlap_save(x,h,L)
N1=length(x);
M=length(h);
x=[x zeros(1,mod(-N1,L)) zeros(1,L)];
N2=length(x);
h=[h zeros(1,L-1)];

S=N2/L;

index=1:L;
xm=x(index);		
x1=[zeros(1,M-1) xm];	
answer=[];
for stage=1:S
    Y = simple_conv(x1,h);
    Y=Y(M:M+L-1);		%Discarding Samples
    answer=[answer Y];
    index3=(((stage)*L)-M+2):((stage+1)*L);		% Selecting Sequence to process
    if(index3(L+M-1)<=N2)
    x1=x(index3);
    end
end
i=1:N1+M-1;
answer=answer(i);
figure()
stem(answer);