% First Order Shelving Low Pass Filter with gain 20dB
% Born June 22 -> f_crit = 6.22 Hz @ -3dB
f_crit = 6220; j = sqrt(-1); fp = f_crit; C = 0.000000015;
K = (10^(20/20)); Kh = (10^(6/20));
tp = 1/(2*pi*fp);
Rf2 = tp/C; R = Rf2./(K-Kh); Rf1 = R*(Kh-1);
tz = (Kh/K)*tp;
fz = 1/(2*pi*tz);

f_start = 100; f_stop = 1000000; 
step = (f_stop - f_start)/4096; 
freq = f_start:step:f_stop;

Tf = K.* (1.+j.*freq./fz)./(1.+j.*freq./fp);

Ms = 20*log10(abs(Tf));
Ps = (180/pi)*angle(Tf);
semilogx(freq,Ms),grid
figure
semilogx(freq,Ps),grid