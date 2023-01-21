% load Data_aoa;

fs = 2.5e7;
Ts = 1 / fs;
T = Ts * length(Data_aoa);

yr = sum(Data_aoa(9:12,:), 1);  % reference channel
ys = sum(Data_aoa(1:8,:), 1);   % surveillance channel

tao = (0: 9);
f = (20:1:40);  % in Hz
C_20_40 = zeros(length(tao),length(f));

for j = 1:length(tao)
    t = linspace(0,T,length(Data_aoa));
    E = exp(1j * 2 * pi * f' * t);
    F = zeros(1,length(f));
    for i = 1:length(f)
        F(i) = E(i,:) .* circshift(yr,tao(j)) * ys';
    end
    C_20_40(j,:) = F;
    j
end

figure;
pcolor(f, tao*12, (abs(C_20_40)));
xlabel('Doppler frequency (HZ)');ylabel('Range (m)');
save C_20_40 C_20_40;
