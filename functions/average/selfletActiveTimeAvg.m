function activeTimeAvg = selfletActiveTimeAvg( activeTable, timeWindowInSec )

timeWindow = timeWindowInSec * 1000;

startTime = 0;
endTime = activeTable.timestamp(end);
startWindow = startTime;
endWindow = startTime + timeWindow;

timestamp = startTime;
selflets = activeTable.selflets(1);
activeTimeAvg = table(timestamp, selflets);

while(endWindow <= endTime)

    subtableRows = activeTable.timestamp >= startWindow & activeTable.timestamp < endWindow;
    subtable = activeTable(subtableRows,:);
    timestamp = endWindow;
    selflets = mean(subtable.selflets);
    newRow = table(timestamp, selflets);
    activeTimeAvg = [activeTimeAvg; newRow];
    startWindow = endWindow;
    endWindow = endWindow + timeWindow;
end

end