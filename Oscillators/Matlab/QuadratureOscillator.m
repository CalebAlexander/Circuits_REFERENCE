% Quadrature Oscillator
f0 = 6220; %Hz
j = sqrt(-1);
C = 10e-9; %F
R = 1/(2*pi*C*f0); % Ohms
Rf = 2*R;

f_start = 100; f_stop = 100000; 
step = (f_stop - f_start)/4096; freq = f_start:step:f_stop;

Ts = -1./((j.*2.*pi.*freq.*R.*C).^2 + (0.5- R./Rf).*(j.*2.*pi.*freq.*R.*C));

Ms = 20*log10(abs(Ts));
Ps = (180/pi)*angle(Ts);
semilogx(freq,Ms),grid
figure
semilogx(freq,Ps),grid