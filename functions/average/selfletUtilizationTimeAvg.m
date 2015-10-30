function [ selfletUtilizationAvg ] = selfletUtilizationTimeAvg( utilizationTable, durationInSec, timeWindow )

duration = durationInSec * 1000;
timeWindow = timeWindow * 1000;
windowStart = 0;
windowEnd = windowStart + timeWindow;

subtableRows = utilizationTable.timestamp == windowStart;
subtable= utilizationTable(subtableRows,:);
timestamp = windowStart;
selflets = num2cell(subtable.selflet,1);
utilization = mean(subtable.utilization);
selfletUtilizationAvg = table(timestamp, selflets, utilization);

while windowEnd <= duration;
   
    subtableRows = utilizationTable.timestamp > windowStart & utilizationTable.timestamp <= windowEnd;
    subtable= utilizationTable(subtableRows,:);
    timestamp = windowEnd;
    selflets = num2cell(unique(subtable.selflet),1);
    utilization = mean(subtable.utilization);
    newRow = table(timestamp,selflets,utilization);
    selfletUtilizationAvg = [selfletUtilizationAvg;newRow];

    windowStart = windowEnd;
    windowEnd = windowStart + timeWindow;
    
end

end

