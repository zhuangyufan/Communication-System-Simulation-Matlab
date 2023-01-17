function [BER_zeroforcing, BER_maxlikely] = simulation(sigma)

symbols = [1+1j, -1+1j, -1-1j, 1-1j]; % QPSK
totalNum = 100000;
acc_zeroforcing = 0;
acc_maxlikely = 0;

% All possible X for maximum likelyhood estimation
X_possible = zeros(4, 256);
for j = 1:4
    for k = 1:4
        for m = 1:4
            for n = 1:4
                X_possible(:,(j-1)*64+(k-1)*16+(m-1)*4+n) = [symbols(j) symbols(k) symbols(m) symbols(n)];
            end
        end
    end
end


for i = 1:totalNum
    % generate symbols, channel matrix and noise vector
    s1 = randsrc(1, 1, symbols);
    s2 = randsrc(1, 1, symbols);
    s3 = randsrc(1, 1, symbols);
    s4 = randsrc(1, 1, symbols);
    S = [s1 s2 s3 s4];
    
    W = sqrt(sigma/2) * (randn(1,4) + 1j*randn(1,4));
    
    h11 = sqrt(1/2) * (randn(1,1) + 1j*randn(1,1));
    h12 = sqrt(1/2) * (randn(1,1) + 1j*randn(1,1));
    h13 = sqrt(1/2) * (randn(1,1) + 1j*randn(1,1));
    h14 = sqrt(1/2) * (randn(1,1) + 1j*randn(1,1));
    h21 = sqrt(1/2) * (randn(1,1) + 1j*randn(1,1));
    h22 = sqrt(1/2) * (randn(1,1) + 1j*randn(1,1));
    h23 = sqrt(1/2) * (randn(1,1) + 1j*randn(1,1));
    h24 = sqrt(1/2) * (randn(1,1) + 1j*randn(1,1));
    H = [[h11,-h12,h12,-h14];[h21,-h22,h23,-h24];conj([h12,h11,h14,h13]);conj([h22,h21,h24,h23])];
    
    Y = H * S.' + W.';
    
    
    % 1 zero-forcing
    S1 = (H \ Y).';
  
    A = symbols.' * ones(1,4);
    B = ones(4,1) * S1;
    C = abs(B - A);
    [~ ,index] = min(C);
    D = zeros(1,4);
    for k = 1:4
        D(k) = symbols(index(k));
    end
    E = D==S;
    acc_zeroforcing =  acc_zeroforcing + sum(E)/4/totalNum;
    
    
    % 2 maximun likelyhood
    F = Y * ones(1,256) - (H * X_possible);  % calculate Y-HX
    G = zeros(1,256);
    for j = 1:256
        G(j) = norm(F(:,j));
    end
    [~, index2] = min(G);   % find optimal X
    I = X_possible(:,index2).';
    J = I==S;
    acc_maxlikely = acc_maxlikely + sum(J)/4/totalNum;
end

BER_zeroforcing = 1- acc_zeroforcing;
BER_maxlikely = 1 - acc_maxlikely;

disp(['finish gamma = ',num2str(10*log10(1/sigma^2)), 'dB']);

end

