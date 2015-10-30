function utilizationSelfletAvg = selfletUtilizationSelfletAvg( utilizationTable )

idMin = min(utilizationTable.selflet);
idMax = max(utilizationTable.selflet);

for id = idMin : idMax

    subtableRows = utilizationTable.selflet == id;
    subtable = utilizationTable(subtableRows,:);
    timestamp = utilizationTable.timestamp(end);
    selflet = id;
    utilization = mean(subtable.utilization);
    
    if(id > idMin)
        newRow = table(timestamp,selflet,utilization);
        utilizationSelfletAvg = [utilizationSelfletAvg;newRow];
    else
        utilizationSelfletAvg = table(timestamp,selflet,utilization);
    end
    
end



end

