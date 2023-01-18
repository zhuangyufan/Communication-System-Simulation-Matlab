% generate PSS
d_25 = find_d_u(25);
d_29 = find_d_u(29);
d_34 = find_d_u(34);

% generate OFDM symbols (IDFT)
x_25 = IDFTsum([d_25 zeros(1,66)]); 
x_29 = IDFTsum([d_29 zeros(1,66)]); 
x_34 = IDFTsum([d_34 zeros(1,66)]); 

% At receiver, apply DFT
y_25 = DFTsum(x_25); y_25 = y_25(1:62);
y_29 = DFTsum(x_29); y_29 = y_29(1:62);
y_34 = DFTsum(x_34); y_34 = y_34(1:62);

% cross-correlation
figure; 
subplot(3,2,1); stem(abs(xcorr(y_25, d_25))); 
title('Cross correlation betweeen u=25 and u = 25'); 
subplot(3,2,3); stem(abs(xcorr(y_29, d_29))); 
title('Cross correlation betweeen u=29 and u = 29'); 
subplot(3,2,5); stem(abs(xcorr(y_34, d_34))); 
title('Cross correlation betweeen u=34 and u = 34'); 
subplot(3,2,2); stem(abs(xcorr(y_25, d_29)));
title('Cross correlation betweeen u=25 and u = 29'); 
subplot(3,2,4); stem(abs(xcorr(y_25, d_34)));
title('Cross correlation betweeen u=25 and u = 34'); 
subplot(3,2,6); stem(abs(xcorr(y_29, d_34)));
title('Cross correlation betweeen u=29 and u = 34'); 
