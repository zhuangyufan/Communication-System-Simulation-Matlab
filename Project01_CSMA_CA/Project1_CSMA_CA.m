userNums = [1:1:50];
effis = zeros(1,length(userNums));
for i = 1:length(userNums)
    effis(i) = simulation(userNums(i));
end
plot(userNums,effis,'LineWidth',2);
xlabel('Number of STAs');
ylabel('Efficiency');
        
