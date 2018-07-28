% Inverting Amplifier Bandpass Filter
C1 = 0.1e-6; K = 7.3; j = sqrt(-1);
f_lower = 100; f_upper = 30000;
R1 = 1/(2*pi*C1*f_lower);
Rf = K*R1;
Cf = 1/(2*pi*Rf*f_upper);

f_start = f_lower/10; f_stop = f_upper*10; 
step = (f_stop - f_start)/4096; freq = f_start:step:f_stop;

LPF = (1./(1.+j*2.*pi.*freq.*Rf.*Cf));
HPF = ((j.*2.*pi.*freq.*R1.*C1)./(1+j.*2.*pi.*freq.*R1.*C1));
Tf = -K.*LPF.*HPF;

Ms = 20*log10(abs(Tf));
Ps = (180/pi)*angle(Tf);
semilogx(freq,Ms),grid
figure
semilogx(freq,Ps),grid