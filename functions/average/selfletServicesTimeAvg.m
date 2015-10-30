function [ servicesTimeAvg ] = selfletServicesTimeAvg( servicesRt, duration, timeWindow )

timeWindow = timeWindow * 1000;
servicesN = length(servicesRt);
servicesTimeAvg = servicesRt;

for serviceIndex = 1:servicesN
    currentServiceTable = servicesRt{serviceIndex};
    serviceName = currentServiceTable.service(1);
    
    timestamp = 0;
    reqType = cell(1,1);
    service = serviceName;
    rt = 0;
    selflets = cell(1,1);
    numberOfReqs = 0;
    newServiceTable = table(timestamp, reqType, service, rt, selflets, numberOfReqs);
    
    startTime = 0;
    endTime = duration * 1000;
    windowStart = startTime;
    windowEnd = windowStart + timeWindow;
    
    while windowEnd <= endTime
       
        if(windowStart >= endTime)
            break;
        end
        
        subtableRows = currentServiceTable.timestamp > windowStart & currentServiceTable.timestamp <= windowEnd;
        subtable = currentServiceTable(subtableRows,:);
        timestamp = windowEnd;
        reqType = cell(1,1);
        reqType{1,1} = char(subtable.reqType);
        service = serviceName;
        rt = uint64(mean(subtable.rt));
        selflets = num2cell(subtable.selflet,1);
        numberOfReqs = height(subtable);
        
        newRow = table(timestamp, reqType, service, rt, selflets, numberOfReqs);
        newServiceTable = [newServiceTable;newRow];
        
        windowStart = windowEnd;
        windowEnd = windowEnd + timeWindow;
    end
    
    servicesTimeAvg{serviceIndex} = newServiceTable;
end

end

