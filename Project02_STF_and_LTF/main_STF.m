noisePower = (0 : 1: 10);
totalNum = 2000;
correctNum = zeros(1,length(noisePower));

for i = 1:length(noisePower)
    for j = 1:totalNum
        beginPoint = simulation_STF(noisePower(i));
        correctNum(i) = correctNum(i) + (beginPoint == 501);
    end
    fprintf('Finish noisePower = %.1d \n', noisePower(i));
end
acc = correctNum / totalNum;

figure;plot(noisePower,acc);grid on
xlabel('Noise power');ylabel('Arrival detection probability of STF');


