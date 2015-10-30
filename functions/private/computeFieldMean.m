function fieldMean = computeFieldMean( testsEvalStruct, field, timestep )

nSample = length(testsEvalStruct);  
dataCell = cell(nSample,1);
data = [field timestep];

for sample = 1:nSample
    if(strcmp(field, 'reqs'))
        tempCell = cell(1,1);
        tempCell{1,1} = testsEvalStruct(sample).(data);
        dataCell{sample,1} = tempCell;
    else
        dataCell{sample,1} = testsEvalStruct(sample).(data);
    end
    
end

switch field
    case 'active'
        fieldMean = selfletActiveMean(dataCell);
    case 'rt'
        fieldMean = selfletServicesRtMean(dataCell);
    case 'reqs'
        fieldMeanCell = selfletServicesRtMean(dataCell);
        fieldMean = fieldMeanCell{1,1};
    case 'score'
        fieldMean = selfletScoreMean(dataCell);
    case 'scoreReq'
        fieldMean = selfletScoreMean(dataCell);
    case 'actions'
        if(isempty(timestep))
            fieldMean = selfletActionsCountMean(dataCell);
        else
            fieldMean = selfletActionsMean(dataCell);
        end
    case 'utilization'
        fieldMean = selfletUtilizationMean(dataCell);
    case 'costsEvalSelflet'
        fieldMean = selfletCostsMean(dataCell);
    case 'cost'
        fieldMean = selfletCostsTotalMean(dataCell);
    case 'started'
        fieldMean = selfletLifeMean(dataCell);
    case 'ended'
        fieldMean = selfletLifeMean(dataCell);
end

end

