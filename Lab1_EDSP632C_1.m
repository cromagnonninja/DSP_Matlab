z = tf('z');
H = 1/(1-0.9*(z^-1));
figure(1);
pzmap(H);
figure(2);
bode(H);