function Circuit1Cap(R1, R2, R3, R4, C)
%            |-R4--C--|
%   Vi---R1--|--R2----|--Vo
%                     |
%                     R3
%                     _
    K = R3/(R1+R2+R3); 
    tp = (R4 + ll(R2, ll(R1,R3)))*C;
    tz = (R2+R4)*C;
    fp = 1/(2*pi*tp);
    fz = 1/(2*pi*tz);
    j = sqrt(-1);

    f_start = 10; f_stop = 100000; 
    step = (f_stop - f_start)/1024; freq = f_start:step:f_stop;
    Ts = K*(1+(j.*2.*pi.*freq).*tz)./(1+(j.*2.*pi.*freq).*tp);
    Ms = 20*log10(abs(Ts));
    Ps = (180/pi)*angle(Ts);
    semilogx(freq,Ms),grid
    figure
    semilogx(freq,Ps),grid
    figure
    H = tf([0 K*tz K],[0 tp 1]);
    bode(H)
end

function out = ll(in1, in2) % computes the parallel
    out = (in1*in2)/(in1+in2);
end