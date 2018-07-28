% First Order High Pass Filter with gain 20dB
% Born June 22 -> f_crit = 6.22 Hz @ -3dB
f_crit = 6220; j = sqrt(-1); K = 10;
C = 0.0000001; Rb = 3000; Ra = 27000;
R = 1/(2*pi*f_crit*C);

f_start = 100; f_stop = 100000; 
step = (f_stop - f_start)/1024; 
freq = f_start:step:f_stop;

Tf = K.*((j.*freq./f_crit)./(1.+j.*freq./f_crit));

Ms = 20*log10(abs(Tf));
Ps = (180/pi)*angle(Tf);
semilogx(freq,Ms),grid
figure
semilogx(freq,Ps),grid