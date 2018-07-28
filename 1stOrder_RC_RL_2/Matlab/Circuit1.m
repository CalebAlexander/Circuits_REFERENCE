% Circuit 1
E0 = 10;
R1 = 12000;
R2 = 15000;
R3 = 4300;
C = 0.000000022;
E = E0*(R1/(R1+R2+R3));
R = R2*(R1+R3)/(R2+(R1+R3));
I = E/R;
tau = R*C
t = 0:tau/100:2*tau;
Vc = E.*(1 - exp(-t./tau));
I2 = Vc./R2;
Ic = (E./R).*exp(-t./tau) 
I3 = I2 + Ic;
Vo = R3.*I3;

subplot(1,3,1)
plot(t,Vo)
subplot(1,3,2)
plot(t,Vc)
subplot(1,3,3)
plot(t,Ic)