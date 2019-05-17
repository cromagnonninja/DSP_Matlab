% N = 1024;
% n = 0:N-1;
% w0 = 2*pi/5;
% x = sin(w0*n)+10*sin(2*w0*n);
% s = spectrogram(x);

y1 = audioread('/Users/bhanubhandari/Desktop/drum.wav'); 
y2 = audioread('/Users/bhanubhandari/Desktop/tmp.wav');
y3 = audioread('/Users/bhanubhandari/Desktop/female.wav'); 
figure(1);
subplot(3,1,1);
spectrogram(y1,hann(4),'yaxis');
subplot(3,1,2);
spectrogram(y2,hann(128),'yaxis');
subplot(3,1,3);
spectrogram(y3,hann(256),'yaxis');
figure(2);
subplot(3,1,1);
spectrogram(y1,hamming(256),'yaxis');
subplot(3,1,2);
spectrogram(y2,hamming(50),'yaxis'); 
subplot(3,1,3);
spectrogram(y3,hamming(4),'yaxis'); 
figure(3);
subplot(3,1,1);
spectrogram(y1,blackman(256),'yaxis');
subplot(3,1,2);
spectrogram(y2,blackman(256),'yaxis'); 
subplot(3,1,3);
spectrogram(y3,blackman(256),'yaxis'); 
%
%