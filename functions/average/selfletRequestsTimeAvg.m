function requestsTimeAvg = selfletRequestsTimeAvg( reqTable, durationInSec, timeWindowInSec )

duration = durationInSec * 1000;
timeWindow = timeWindowInSec * 1000;
windowStart = 0;
windowEnd = windowStart + timeWindow;
lastReq = max(reqTable.timestamp);

while windowEnd <= duration;
   
    if(windowStart > lastReq)
        break;
    end
    
    subtableRows = reqTable.timestamp > windowStart & reqTable.timestamp <= windowEnd;
    subtable= reqTable(subtableRows,:);
    timestamp = windowEnd;
    service = subtable.service(1);
    rt = uint64(mean(subtable.rt));
    selflets = num2cell(unique(subtable.selfletID),1);
    numberOfReqs = sum(subtable.numberOfReqs);
    
    if(windowStart > 0)
        newRow = table(timestamp,service,rt,selflets,numberOfReqs);
        requestsTimeAvg = [requestsTimeAvg;newRow];
    else
        requestsTimeAvg = table(timestamp,service,rt,selflets,numberOfReqs);
    end

    windowStart = windowEnd;
    windowEnd = windowStart + timeWindow;
    
end

end

