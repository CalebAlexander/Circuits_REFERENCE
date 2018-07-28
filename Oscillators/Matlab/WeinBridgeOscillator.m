% Wein Bridge Oscillator
f0 = 6220; %Hz
j = sqrt(-1);
C = 1e-9; %F
R = 1/(2*pi*C*f0); % Ohms
R3 = 20000; R4 = 10000;
K = 1 + (R3/R4);

f_start = 100; f_stop = 100000; 
step = (f_stop - f_start)/4096; freq = f_start:step:f_stop;

Ts = K.*(j.*2.*pi.*freq.*R.*C)./((j.*2.*pi.*freq.*R.*C).^2 + K.*(j.*2.*pi.*freq.*R.*C) + 1);

Ms = 20*log10(abs(Ts));
Ps = (180/pi)*angle(Ts);
semilogx(freq,Ms),grid
figure
semilogx(freq,Ps),grid