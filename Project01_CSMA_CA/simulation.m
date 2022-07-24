function [effi] = simulation(userNum)

DIFS=50;
Slot=10;
Data=150;

busyTime = 0;
totalTime = 1000000;

whoTransmitting = 0;   % =i if i is transmitting, =0 if channel is ldle

usersTimer = randi([1,31],[1,userNum]);  % initiallize usersTimer
usersDIFS = ones(1,userNum) * DIFS;      % initiallize usersDIFS

for t = 0:totalTime
    if whoTransmitting > 0
        usersDIFS = ones(1,userNum) * DIFS;
        DataTransmitting = DataTransmitting - 1;        
        busyTime = busyTime + 1;
        
        if DataTransmitting == 0
            usersTimer(whoTransmitting) = randi([1,31]) * Slot;
            whoTransmitting = 0;           
        end
        
        continue
    end
    
    
    for i = 1:userNum
        if usersDIFS(i) > 0
            usersDIFS(i) = usersDIFS(i) - 1;
            continue
        end

        if usersDIFS(i) == 0 && usersTimer(i)>0
            usersTimer(i) = usersTimer(i) - 1;
            continue
        end
        
        if usersDIFS(i) == 0 && usersTimer(i) == 0
            DataTransmitting = Data;
            whoTransmitting = i;
            break;
        end
        
    end
        
end

effi = busyTime / totalTime;
end

