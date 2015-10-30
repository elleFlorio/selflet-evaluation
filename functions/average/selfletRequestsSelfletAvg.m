function [ requestSelfletAvg ] = selfletRequestsSelfletAvg( reqTable )

idMin = min(reqTable.selfletID);
idMax = max(reqTable.selfletID);

for id = idMin : idMax

    subtableRows = reqTable.selfletID == id;
    subtable = reqTable(subtableRows,:);
    if(height (subtable) == 0)
        continue
    end
    timestamp = subtable.timestamp(end);
    service = subtable.service(1);
    rt = uint64(mean(subtable.rt));
    selflets = id;
    count = sum(subtable.numberOfReqs);
    
    if(id > idMin)
        newRow = table(timestamp,service,rt,selflets,count);
        requestSelfletAvg = [requestSelfletAvg;newRow];
    else
        requestSelfletAvg = table(timestamp,service,rt,selflets,count);
    end
    
end

