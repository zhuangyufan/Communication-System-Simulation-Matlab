NoisePowers = (0 : 1: 10);
NUM = 20000;
Vs = zeros(1, length(NoisePowers));

for i = 1:length(NoisePowers)
    Vs(i) = simulation_LTF(NoisePowers(i), NUM);
    i
end

figure;
plot(NoisePowers, Vs);
xlabel('Noise power');
ylabel('Error variance');
title('Error variance versus the SNR level');
grid on;
