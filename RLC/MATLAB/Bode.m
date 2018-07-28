% Transfer Function
R1 = 68000;
R2 = 33000;
R3 = 6800;
L = 0.003;
C = 1*10^-12;
w_start = 1000000*2*pi; w_stop = 10000000*2*pi;
w = w_start:(w_stop-w_start)/2000:w_stop;
s = 1j.*w;
R = R3 + (R1*R2/(R1+R2))
w0 = 1/sqrt(L*C);
Q = w0.*L./R;
Qn = w0*L/R3;
K = R2/(R1+R2);
T = K.*((s./w0).^2+(s./(Qn.*w0))+1)./((s./w0).^2+(s./(Q.*w0))+1);
Mag = 20.*log10(abs(T)), grid
Phase = (180/pi)*angle(T), grid
semilogx(w./(2*pi),Mag)
figure
semilogx(w./(2*pi),Phase)
%H = tf([(1./w0)^2 L./(w0^2*R3) 1],[(1./w0)^2 L./(w0^2*R) 1]);
%bode(H,{10^9 10^10})