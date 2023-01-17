scrambler_seed = [1 0 1 1 1 0 1];

% scramble
scrambler = scrambler_seed;
scramble_in = ones(1,32);
scramble_out = scramble_in;
for i = 1:length(scramble_out)
    t = xor(scrambler(1), scrambler(4));
    scramble_out(i) = xor(scramble_out(i), t);
    scrambler = circshift(scrambler, -1);
    scrambler(length(scrambler)) = t;
end

% de-scramble
descrambler = scrambler_seed;
descramble_out = scramble_out;
for i = 1:length(descramble_out)
    t = xor(descrambler(1), descrambler(4));
    descramble_out(i) = xor(descramble_out(i), t);
    descrambler = circshift(descrambler, -1);
    descrambler(length(descrambler)) = t;
end

figure;
subplot(3,1,1);stem(scramble_in);title('scramble input');
subplot(3,1,2);stem(scramble_out);title('scramble output');
subplot(3,1,3);stem(descramble_out);title('descramble output');


