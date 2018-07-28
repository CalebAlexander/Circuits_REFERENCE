% First Order Shelving All Pass Filter with gain 0dB
f_crit = 6220; j = sqrt(-1); fo = f_crit; C = 0.000000015;
K = 1;
R = 1/(2*pi*C*fo);

f_start = 100; f_stop = 1000000; 
step = (f_stop - f_start)/4096; 
freq = f_start:step:f_stop;

Tf = K.* (1-j.*freq./fo)./(1+j.*freq./fo);
    
Ms = 20*log10(abs(Tf));
Ps = (180/pi)*angle(Tf);
semilogx(freq,Ms),grid, axis([100 1000000 -10 30])
figure
semilogx(freq,Ps),grid 