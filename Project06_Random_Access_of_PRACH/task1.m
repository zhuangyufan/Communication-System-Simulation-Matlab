P = zeros(64,62);
for i = 1:64
    P(i,:) = find_d_u(i);
end

figure;
subplot(2,4,1)
stem(abs(xcorr(P(1,:), P(1,:))));title('cross-correlation of u=1 and u=1');
subplot(2,4,2)
stem(abs(xcorr(P(1,:), P(9,:))));title('cross-correlation of u=1 and u=9');
subplot(2,4,3)
stem(abs(xcorr(P(1,:), P(17,:))));title('cross-correlation of u=1 and u=17');
subplot(2,4,4)
stem(abs(xcorr(P(1,:), P(25,:))));title('cross-correlation of u=1 and u=25');
subplot(2,4,5)
stem(abs(xcorr(P(1,:), P(33,:))));title('cross-correlation of u=1 and u=33');
subplot(2,4,6)
stem(abs(xcorr(P(1,:), P(41,:))));title('cross-correlation of u=1 and u=41');
subplot(2,4,7)
stem(abs(xcorr(P(1,:), P(49,:))));title('cross-correlation of u=1 and u=49');
subplot(2,4,8)
stem(abs(xcorr(P(1,:), P(57,:))));title('cross-correlation of u=1 and u=57');




