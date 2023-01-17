function [beginPoint] = simulation_STF(NoisePower)

cfgHT = wlanHTConfig('ChannelBandwidth', 'CBW20');
STF = wlanLSTF(cfgHT);
s = sqrt(NoisePower/2) * (randn(1,1000) + 1j* randn(1,1000));
s(501:660) = s(501:660) + STF.';

% Auto Correlation
rho1 = zeros(1, 800);
for i = 1:length(rho1)
    rho1(i) = s(i:i+79) * s(i+80:i+159)' / 80;
end
[~, index1] = max(abs(rho1));

% Cross Correlation
% rho2 = zeros(1,21);
% for i = 1:length(rho2)
%     if index1 - 11 + i > 0 && index1 + 148 + i <= length(s)
%         rho2(i) = s(index1 - 11 + i : index1 + 148 + i) * conj(STF);
%     end
% end

rho2 = zeros(1,800);
for i = 1:length(rho2)
    rho2(i) = s(i:i+159) * conj(STF);
end

[~, index2] = max(abs(rho2));

% beginPoint = index1 + index2 - 11;
beginPoint = index2;
end

