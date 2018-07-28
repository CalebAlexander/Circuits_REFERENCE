% First Order Shelving High Pass Filter with gain 20dB
% Born June 22 -> f_crit = 6.22 Hz @ -3dB
f_crit = 6220; j = sqrt(-1); fz = f_crit; C = 0.000000015;
K = -(10^(6/20)); Kh = -(10^(20/20));
tz = 1/(2*pi*fz); R2 = tz/C;
Rf = R2/((1/Kh)-(1/K));
tp = (K/Kh)*tz;
fp = 1/(2*pi*tp);

f_start = 100; f_stop = 1000000; 
step = (f_stop - f_start)/4096; 
freq = f_start:step:f_stop;

Tf = K.* (1.+j.*freq./fz)./(1.+j.*freq./fp);

Ms = 20*log10(abs(Tf));
Ps = (180/pi)*angle(Tf);
semilogx(freq,Ms),grid
figure
semilogx(freq,Ps),grid