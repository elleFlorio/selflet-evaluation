function [activeSelflets, startTime, endTime] = selfletReadActiveSelflets( fileName, duration, startSelflets )

durationMsec = duration * 1000;
tempTable = readtable(fileName, 'Format', '%u64%d');
noZeroRows = tempTable.selflets > startSelflets - 1;
tempTable = tempTable(noZeroRows,:);
startTime = tempTable.timestamp(1);
endTime = tempTable.timestamp(end);
tempTable.timestamp = tempTable.timestamp - startTime;
if (duration > 0)
    inTimeRows = tempTable.timestamp < durationMsec;
    activeSelflets = tempTable(inTimeRows,:);
else
    activeSelflets = tempTable;
end

end

