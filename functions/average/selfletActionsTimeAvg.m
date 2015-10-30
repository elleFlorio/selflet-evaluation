function actionsTimeAvg = selfletActionsTimeAvg( actions, durationInSec, timeWindowInSec )

timeWindow = timeWindowInSec * 1000;
duration = durationInSec * 1000;

ActionsN = length(actions);
actionsTimeAvg = actions;

for cur_action = 1:ActionsN
    currentActionTable = actions{cur_action};
    actionName = currentActionTable.action(1);
    timestamp = 0;
    action = actionName;
    numberOfActions = 0;
    newActionTable = table(timestamp, action, numberOfActions);
    
    startTime = 0;
    endTime = duration;
    windowStart = startTime;
    windowEnd = windowStart + timeWindow;
    
    while windowEnd <= endTime
        
        if(windowStart >= endTime)
            break;
        end
        
        subtableRows = currentActionTable.timestamp > windowStart & currentActionTable.timestamp <= windowEnd;
        subtable = currentActionTable(subtableRows,:);
        timestamp = windowEnd;
        action = actionName;
        numberOfActions = height(subtable);
        newRow = table(timestamp,action,numberOfActions);
        newActionTable = [newActionTable;newRow];
        
        windowStart = windowEnd;
        windowEnd = windowEnd + timeWindow;
    end
    actionsTimeAvg{cur_action} = newActionTable;
end

end

