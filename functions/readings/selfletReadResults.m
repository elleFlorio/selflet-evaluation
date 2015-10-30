function [ resultsTable, servicesRt ] = selfletReadResults( fileName, startTime, duration, servicesNames )

resultsTable = readtable(fileName, 'Format', '%u64%C%C%d%d%d');
resultsTable.timestamp = resultsTable.timestamp - startTime;
durationMsec = duration * 1000;
inTimeRows = resultsTable.timestamp <= durationMsec;
resultsTable = resultsTable(inTimeRows,:);
servicesRt = cell(1,length(servicesNames));

for service=1:length(servicesNames)
    currentName = servicesNames{1,service};
    rows = resultsTable.service == currentName;
    currentSubtable = resultsTable(rows,:);
    currentSubtable = sortrows(currentSubtable,'timestamp','ascend');
    servicesRt{1,service} = currentSubtable;
end

end