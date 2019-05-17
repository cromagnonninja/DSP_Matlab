% Specifications of LPF/BPF: 
% Passband ripple < 1 dB 
% Passband edge = 4 KHz 
% Stopband attenuation >= 40 dB 
% Stopband edge = 6 KHz 
% Sample rate = 24 Khz
% Using Hamming and Hanning Window 
% Normalised axes

rp = power(10,1/10);
rs = power(10,-4);
fp = 4000; 
fs = 6000;
f = 24000;
filter_order = ((-20*log(sqrt(rp*rs)) - 13)*f)/(14.6*(fs-fp));
filter_order = ceil(filter_order);
wp = 2*fp/f; 
ws = 2*fs/f;
band = [wp ws];

hamm_lp = fir1(filter_order,ws,'low');
hamm_hp = fir1(filter_order,wp,'high');
figure(1);
freqz(hamm_lp);
figure(2);
freqz(hamm_hp);

hann_lp = fir1(filter_order,ws,'low',hann([0:ws]));
hann_hp = fir1(filter_order,wp,'high',hann([wp:ceil(2*pi):1]));
figure(3);
freqz(hann_lp);
figure(4);
freqz(hann_hp);