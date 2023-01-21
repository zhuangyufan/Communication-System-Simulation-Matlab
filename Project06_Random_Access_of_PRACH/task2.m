% generate standard preamble sequence
P = zeros(64,62);
for i = 1:64
    P(i,:) = find_d_u(i);
end

errorRates = zeros(1,5);
SNRs = (-20:5:0);
for k = 1:length(SNRs)
    errorNum = 0;
    totalNum = 100;
    SNR = SNRs(k);
    for rd = 1:totalNum
        u = randi([1,64]);
        Pn = 10^(-SNR/10);
        n = sqrt(Pn)*randn(1,62)*(1+1j)/sqrt(2);
        y = find_d_u(u) + n;   % received signal

        % cross-correlation
        centerValue = zeros(1,63);
        for i = 1:63
            c = abs(xcorr(P(i,:), y));
            centerValue(i) = c(62);
        end
        [~,u1] = max(centerValue');

        errorNum = errorNum + (u~=u1);
    end
    errorRate = errorNum / totalNum;
    errorRates(k) = errorRate;
    k
end

figure;
semilogy(SNRs,errorRates);
xlabel('SNR(dB)'); ylabel('10log10(P_r))');
title('The error probability of cross-correlation detection under different SNR')