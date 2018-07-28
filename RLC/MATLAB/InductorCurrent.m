% Inductor Current
R1 = 68000;
R2 = 33000;
R3 = 6800;
L = 0.003;
C = 1*10^-12;
E0 = 10;
R = R3+(R1*R2)/(R1+R2);
a = R/(2*L);
p = R/2 * sqrt(C/L)
w0 = 1/(sqrt(L*C))
f0 = w0/(2*pi);
wd = w0*sqrt(1-p^2)

E = E0*R2/(R1+R2);
tmax = 3/f0;
t = 0:tmax/1024:tmax;
i = (E/R).*(2.*p./sqrt(1-p^2) .* exp(-a.*t) .* sin(wd.*t));
plot(t,i)