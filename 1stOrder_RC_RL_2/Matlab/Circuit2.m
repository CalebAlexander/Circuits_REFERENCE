% Circuit 2
E0 = 10;
R1 = 12000;
R2 = 15000;
R3 = 4300;
L = 0.003
E = E0*(R1/(R1+R2+R3));
R = R2*(R1+R3)/(R2+(R1+R3));
I = E./R;
tau = L/R;
t = 0:tau/100:2*tau;
Il = I.*(1 - exp(-t./tau));
Vl = (I.*R).*exp(-t./tau) 
I2 = Vl./R2;
I3 = I2 + Il;
Vo = R3.*I3;

subplot(1,3,1)
plot(t,Vo)
subplot(1,3,2)
plot(t,Vl)
subplot(1,3,3)
plot(t,Il)