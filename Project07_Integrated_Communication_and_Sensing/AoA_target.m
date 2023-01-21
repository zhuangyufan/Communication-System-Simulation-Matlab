% load Data_aoa;

% AoA of target array (MUSIC Algorithm)
c = 3e8;
f = 2.12e9;
lambda = c / f;
d = 0.5 * lambda;
N = 8;

X = Data_aoa((1:8),:);
Rx = X * X' / length(Data_aoa);
[V,D] = eig(Rx);

theta = linspace(-pi/2, pi/2, 1000);
phi = 2 * pi * d .* sin(theta) / lambda;
A = exp(-1j * (0:N-1)' * phi);

V_noise = V(:,(1:7));
P = V_noise' * A;
Q = 1 ./ diag(P' * P);

figure; plot(theta, Q);grid on;
set(gca,'xlim',[-pi/2, pi/2]);
set(gca,'xtick',-pi/2 : pi/6 : pi/2);
set(gca,'XTickLabel',{'-\pi/2','-\pi/3','-\pi/6','0','\pi/6','\pi/3','\pi/2'});
xlabel('\theta'); ylabel('P(\theta)'); title('AoA of target array');

[~,AoA] = max(Q);
AoA = 0.18 * AoA - 90;
