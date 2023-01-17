function [V] = simulation_LTF(NoisePower, NUM)
deviation = zeros(1,NUM);

for i = 1:NUM
    cfgHT = wlanHTConfig('ChannelBandwidth', 'CBW20');

    y = wlanLLTF(cfgHT);
    x = sqrt(NoisePower/2) * (randn(1000,1) + 1j* randn(1000,1));
    x(501:660)=x(501:660)+y;
    x1 = conv(x, [1 0 0 0 0 0 0 0 0 0 0 0 0.6]);  % mulitpath
    
    z = conj(y(160:-1:1));
    con = abs(conv(x1,z));  % synchronization
    [~, begin] = max(abs(con));
    deviation(i) = begin - 660;
end
V = var(deviation);
end

