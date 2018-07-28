% Phase Shift Oscillator
f0 = 6220; %Hz
j = sqrt(-1);
C = 1e-9; %F
R = 1/(2*pi*C*f0*sqrt(6)); % Ohms
K1 = 6; K2 = 5;
Rf = K1*K2*R;
K = -Rf/R;

f_start = 100; f_stop = 100000; 
step = (f_stop - f_start)/4096; freq = f_start:step:f_stop;

Ts = K.*((j.*2.*pi.*freq.*R.*C).^3)./((j.*2.*pi.*freq.*R.*C).^3 + K1.*(j.*2.*pi.*freq.*R.*C).^2 + K2.*(j.*2.*pi.*freq.*R.*C + 1));

Ms = 20*log10(abs(Ts));
Ps = (180/pi)*angle(Ts);
semilogx(freq,Ms),grid
figure
semilogx(freq,Ps),grid