% generate PSS
d_25 = find_d_u(25);
figure; plot(d_25, 'o');
xlabel('Real part'); ylabel('Imaginary part'); title('PSS u = 25');


x_128 = IDFTsum([d_25 zeros(1,66)]);  % 1.92MHz  128 points
x_256 = IDFTsum([d_25 zeros(1,194)]);  % 3.84MHz  256 points
x_512 = IDFTsum([d_25 zeros(1,450)]);  % 7.68MHz  512 points
x_1024 = IDFTsum([d_25 zeros(1,962)]);  % 15.36MHz  1024 points
x_1536 = IDFTsum([d_25 zeros(1,1474)]);  % 23.04MHz  1536 points
x_2048 = IDFTsum([d_25 zeros(1,1986)]);  % 30.72MHz  2048 points


figure;
subplot(6,2,1);plot(real(x_128));xlabel('n');ylabel('real(x_n^1^2^8)');
subplot(6,2,2);plot(imag(x_128));xlabel('n');ylabel('imag(x_n^1^2^8)');

subplot(6,2,3);plot(real(x_256));xlabel('n');ylabel('real(x_n^2^5^6)');
subplot(6,2,4);plot(imag(x_256));xlabel('n');ylabel('imag(x_n^2^5^6)');

subplot(6,2,5);plot(real(x_512));xlabel('n');ylabel('real(x_n^5^1^2)');
subplot(6,2,6);plot(imag(x_512));xlabel('n');ylabel('imag(x_n^5^1^2)');

subplot(6,2,7);plot(real(x_1024));xlabel('n');ylabel('real(x_n^1^0^2^4)');
subplot(6,2,8);plot(imag(x_1024));xlabel('n');ylabel('imag(x_n^1^0^2^4)');

subplot(6,2,9);plot(real(x_1536));xlabel('n');ylabel('real(x_n^1^5^3^6)');
subplot(6,2,10);plot(imag(x_1536));xlabel('n');ylabel('imag(x_n^1^5^3^6)');

subplot(6,2,11);plot(real(x_2048));xlabel('n');ylabel('real(x_n^2^0^4^8)');
subplot(6,2,12);plot(imag(x_2048));xlabel('n');ylabel('imag(x_n^2^0^4^8)');

% sample at 1.92 MHz
x_128_sampled = x_128;
x_256_sampled = x_256(1:2:256);
x_512_sampled = x_512(1:4:512);
x_1024_sampled = x_1024(1:8:1024);
x_1536_sampled = x_1536(1:12:1536);
x_2048_sampled = x_2048(1:16:2048);

figure;
subplot(6,2,1);plot(real(x_128_sampled));xlabel('n');ylabel('real(x_n^1^2^8)');
subplot(6,2,2);plot(imag(x_128_sampled));xlabel('n');ylabel('imag(x_n^1^2^8)');

subplot(6,2,3);plot(real(x_256_sampled));xlabel('n');ylabel('real(x_n^2^5^6)');
subplot(6,2,4);plot(imag(x_256_sampled));xlabel('n');ylabel('imag(x_n^2^5^6)');

subplot(6,2,5);plot(real(x_512_sampled));xlabel('n');ylabel('real(x_n^5^1^2)');
subplot(6,2,6);plot(imag(x_512_sampled));xlabel('n');ylabel('imag(x_n^5^1^2)');

subplot(6,2,7);plot(real(x_1024_sampled));xlabel('n');ylabel('real(x_n^1^0^2^4)');
subplot(6,2,8);plot(imag(x_1024_sampled));xlabel('n');ylabel('imag(x_n^1^0^2^4)');

subplot(6,2,9);plot(real(x_1536_sampled));xlabel('n');ylabel('real(x_n^1^5^3^6)');
subplot(6,2,10);plot(imag(x_1536_sampled));xlabel('n');ylabel('imag(x_n^1^5^3^6)');

subplot(6,2,11);plot(real(x_2048_sampled));xlabel('n');ylabel('real(x_n^2^0^4^8)');
subplot(6,2,12);plot(imag(x_2048_sampled));xlabel('n');ylabel('imag(x_n^2^0^4^8)');

