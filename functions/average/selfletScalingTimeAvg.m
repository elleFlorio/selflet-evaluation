function [ scalingTimeAvg ] = selfletScalingTimeAvg( startEndTable, durationInSec, timeWindow )

duration = durationInSec * 1000;
timeWindow = timeWindow * 1000;
windowStart = 0;
windowEnd = windowStart + timeWindow;

subtableRows = startEndTable.timestamp == windowStart;
subtable= startEndTable(subtableRows,:);
timestamp = windowStart;
selflets = num2cell(subtable.selflet,1);
count = height(subtable);
scalingTimeAvg = table(timestamp,selflets,count);

while windowEnd <= duration;
   
    subtableRows = startEndTable.timestamp > windowStart & startEndTable.timestamp <= windowEnd;
    subtable= startEndTable(subtableRows,:);
    timestamp = windowEnd;
    selflets = num2cell(subtable.selflet,1);
    count = height(subtable);
    newRow = table(timestamp,selflets,count);
    scalingTimeAvg = [scalingTimeAvg;newRow];

    windowStart = windowEnd;
    windowEnd = windowStart + timeWindow;
    
end

end