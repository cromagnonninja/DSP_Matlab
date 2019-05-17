% Window - Rectangular 
% Window - Hamming Window
% Window - Hanning Window 
% Window - Blackman 
rp = 0.05;
rs = 0.04;
fp = 1500; 
fs = 2000;
f = 9000;
filter_order = ((-20*log(sqrt(rp*rs)) - 13)*f)/(14.6*(fs-fp));
filter_order = ceil(filter_order);
wp = 2*fp/f; 
ws = 2*fs/f;
band = [wp ws];

hamm_lp = fir1(filter_order,ws,'low');
hamm_hp = fir1(filter_order,wp,'high');
hamm_bp = fir1(filter_order,band,'bandpass');
hamm_bs = fir1(filter_order,band,'stop');
figure(1);
freqz(hamm_lp);
figure(2);
freqz(hamm_hp);
figure(3);
freqz(hamm_bp);
figure(4);
freqz(hamm_bs);

hann_lp = fir1(filter_order,ws,'low',hann([0:ws]));
hann_hp = fir1(filter_order,wp,'high',hann([wp:ceil(2*pi):1]));
hann_bp = fir1(filter_order,band,'bandpass',hann(band));
hann_bs = fir1(filter_order,band,'stop',hann(band));

figure(5);
freqz(hann_lp);
figure(6);
freqz(hann_hp);
figure(7);
freqz(hann_bp);
figure(8);
freqz(hann_bs);

rect_lp = fir1(filter_order,ws,'low',rectwin([0:ws]));
rect_hp = fir1(filter_order,wp,'high',rectwin([wp:2*pi:1]));
rect_bp = fir1(filter_order,band,'bandpass',rectwin(band));
rect_bs = fir1(filter_order,band,'stop',rectwin(band));

figure(9);
freqz(rect_lp);
figure(10);
freqz(rect_hp);
figure(11);
freqz(rect_bp);
figure(12);
freqz(rect_bs);

blackman_lp = fir1(filter_order,ws,'low',blackman([0:ws]));
blackman_hp = fir1(filter_order,wp,'high',blackman(wp:ceil(2*pi):1));
blackman_bp = fir1(filter_order,band,'bandpass',blackman(band));
blackman_bs = fir1(filter_order,band,'stop',blackman(band));

figure(13);
freqz(blackman_lp);
figure(14);
freqz(blackman_hp);
figure(15);
freqz(blackman_bp);
figure(16);
freqz(blackman_bs);

%rect_hp = fir1(filter_order)
%rect_bp = fir1(filter_order)
%rect_br = fir1(filter_order)

%hann_lp = fir1(filter_order)
%hann_hp = fir1(filter_order)
%hann_bp = fir1(filter_order)
%hann_br = fir1(filter_order)
