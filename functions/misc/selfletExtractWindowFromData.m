function window = selfletExtractWindowFromData(data, timeWindowStartInSec, timeWindowEndInSec)
 
timeWindowStart = timeWindowStartInSec * 1000;
timeWindowEnd = timeWindowEndInSec * 1000;
duration = timeWindowEnd - timeWindowStart;

if(iscell(data))
    nSubdata = length(data);
    windowData = cell(1,nSubdata);
    for subdata = 1:nSubdata
        curTable = data{1,subdata};
        subtableRows = curTable.timestamp >= timeWindowStart & curTable.timestamp <= timeWindowEnd;
        curWindow = curTable(subtableRows,:);
        windowData{1,subdata} = curWindow;
    end
else
    subtableRows = data.timestamp >= timeWindowStart & data.timestamp <= timeWindowEnd;
    windowData = data(subtableRows,:);
end

window.('data') = windowData;
window.('duration') = duration;

end