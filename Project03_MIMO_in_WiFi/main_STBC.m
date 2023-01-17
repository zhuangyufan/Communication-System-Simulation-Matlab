gamma = (0:5:25); % in dB       gamma = 1/sigma^2   sigma = 1/sqrt(gamma)
sigma = 1./sqrt(10.^(gamma/10));

BER_zeroforcing = zeros(1,length(gamma));
BER_maxlikely = zeros(1,length(gamma));

for i = 1:length(sigma)
    [BER_zeroforcing(i), BER_maxlikely(i)] = simulation_STBC(sigma(i));
end

figure;
semilogy(gamma, BER_zeroforcing, gamma, BER_maxlikely);
xlabel('\gamma(dB)'); ylabel('BER');
legend('Zero-forcing', 'Maximum likelihood');
title('Detection performance versus SNR of different MIMO detector');
grid on;