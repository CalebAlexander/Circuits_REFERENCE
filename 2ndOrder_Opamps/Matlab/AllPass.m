% Second Order All Pass Filter
f0 = 6220; %Hz
j = sqrt(-1);
Q = 3;
K = 1;

f_start = 100; f_stop = 100000; 
step = (f_stop - f_start)/4096; 
freq = f_start:step:f_stop;

Tf = K.*(((j.*freq./f0).^2 - (1./Q).*(j.*freq./f0)+ 1)./((j.*freq./f0).^2.+(1./Q).*(j.*freq./f0)+1))
    
Ms = 20*log10(abs(Tf));
Ps = (180/pi)*angle(Tf);
semilogx(freq,Ms),grid, axis([100 100000 -30 10])
figure
semilogx(freq,Ps),grid