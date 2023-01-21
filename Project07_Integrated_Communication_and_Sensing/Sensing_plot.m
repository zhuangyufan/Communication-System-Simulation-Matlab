load C_0_19;
load C_20_40;
load C_m20_m1;
load C_m40_m21;
C = [C_m40_m21 C_m20_m1 C_0_19 C_20_40];

tao = (0: 9);
f = (-40:1:40);  % in Hz

figure;
pcolor(f, tao*12, (abs(C)));
xlabel('Doppler frequency (HZ)');ylabel('Range (m)');

