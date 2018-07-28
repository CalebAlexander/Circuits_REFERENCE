function fp = Homework1Part3(R1, C1, R2, C2)
    % Vi -----R1---C1 ------ Vo         *No prefixes on input units*
    %                   |
    %                   C2
    %                   |
    %                   R2
    %                   _
    C = (C1*C2)/(C1+C2);  R = R1 + R2;
    tz = R2*C2; tp = R*C; K = C/C2; f_start = 10; f_stop = 100000; 
    step = (f_stop - f_start)/1024; freq = f_start:step:f_stop;
    Ts = K*(1+(j.*2.*pi.*freq).*tz)./(1+(j.*2.*pi.*freq).*tp);
    Ms = 20*log10(abs(Ts));
    Ps = (180/pi)*angle(Ts);
    semilogx(freq,Ms),grid
    figure
    semilogx(freq,Ps),grid
    figure
    H = tf([0 K*R2*C2 K],[0 R*C 1]);
    bode(H)
end

