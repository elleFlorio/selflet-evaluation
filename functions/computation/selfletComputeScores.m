function [ scores ] = selfletComputeScores( servicesRt, maxRtTable )

servicesN = height(maxRtTable);
tempCellArray = cell(3, servicesN);
scoreRows = {'Total reqs' 'Violations' 'Violation score'};
scoreHeaders = maxRtTable.Properties.RowNames';

for serviceIndex = 1:servicesN
    currentServiceTable = servicesRt{1,serviceIndex};
    currentServiceName = char(currentServiceTable.service(1));
    
    noZeroRows = currentServiceTable.rt > 0;
    currentServiceTable = currentServiceTable(noZeroRows,:);
    
    totalValue = height(currentServiceTable);
    currentServiceMaxRt = maxRtTable.servicesMaxRt(currentServiceName);
    violationRows = currentServiceTable.rt > currentServiceMaxRt;
    violationValue = sum(violationRows);
    violationScore = violationValue * 100 / totalValue;
    tempCellArray{1,serviceIndex} = totalValue;
    tempCellArray{2,serviceIndex} = violationValue;
    tempCellArray{3,serviceIndex} = violationScore;
end

scores = cell2table(tempCellArray, 'VariableNames', scoreHeaders, 'RowNames', scoreRows);

end