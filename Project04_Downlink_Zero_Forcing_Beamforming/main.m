totalNum = 1000000;
SNRs = zeros(4, totalNum);

for i = 1:totalNum
    % channel matrix
    H1 = sqrt(1/2) * (randn(1,4) + 1j*randn(1,4));
    H2 = sqrt(1/2) * (randn(1,4) + 1j*randn(1,4));
    H3 = sqrt(1/2) * (randn(1,4) + 1j*randn(1,4));
    H4 = sqrt(1/2) * (randn(1,4) + 1j*randn(1,4));
    H = [H1; H2; H3; H4];
    
    % precoder
    E1 = null([H2; H3; H4]);
    E2 = null([H1; H3; H4]);
    E3 = null([H1; H2; H4]);
    E4 = null([H1; H2; H3]);
    P1 = (H1 * E1) * E1;
    P2 = (H2 * E2) * E2;
    P3 = (H3 * E3) * E3;
    P4 = (H4 * E4) * E4;
    P = [P1 P2 P3 P4];
    
    % signal
    symbols = sqrt(1/2) * [1+1j, -1+1j, -1-1j, 1-1j]; % QPSK
    s1 = randsrc(1, 1, symbols);
    s2 = randsrc(1, 1, symbols);
    s3 = randsrc(1, 1, symbols);
    s4 = randsrc(1, 1, symbols);
    S = [s1; s2; s3; s4];

    % channel
    Z = 0.1*sqrt(1/2) * (randn(4,1) + 1j*randn(4,1));   % AWGN noise
    Y = H * P * S + Z;  
    
    % decoding
    S_hat = Y ./ [(H1*E1)^2; (H2*E2)^2; (H3*E3)^2; (H4*E4)^2];

    % calculate SNR
    SNR = abs(H * P * S) ./ abs(Z);
    SNRs(:, i) = SNR;
end

SNR1 = SNRs(1,:);
SNR2 = SNRs(2,:);
SNR3 = SNRs(3,:);
SNR4 = SNRs(4,:);

figure;
subplot(2,2,1)
histogram(10*log10(SNR1),(-50:0.05:50),'normalization','pdf','EdgeColor','g');
xlabel('SNR(dB)'); ylabel('Probability'); 
title('PDF of SNR of Rx_1');

subplot(2,2,2)
histogram(10*log10(SNR2),(-50:0.05:50),'normalization','pdf','EdgeColor','r');
xlabel('SNR(dB)'); ylabel('Probability'); 
title('PDF of SNR of Rx_2');

subplot(2,2,3)
histogram(10*log10(SNR3),(-50:0.05:50),'normalization','pdf','EdgeColor','magenta');
xlabel('SNR(dB)'); ylabel('Probability'); 
title('PDF of SNR of Rx_3');

subplot(2,2,4)
histogram(10*log10(SNR4),(-50:0.05:50),'normalization','pdf','EdgeColor','b');
xlabel('SNR(dB)'); ylabel('Probability'); 
title('PDF of SNR of Rx_4');


