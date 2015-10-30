function actionsCountMean = selfletActionsCountMean(actionsCell)
nSample = length(actionsCell);
nActions = length(actionsCell{1});
actionsCountCell = cell(1,nActions);
variableNames = cell(1,nActions);

for action = 1:nActions
    curName = actionsCell{1}{action}.action(1);
    for sample = 1:nSample
        curAction = actionsCell{sample}{action};
        count = height(curAction);
        if(sample == 1)
            countTot = count;
        else
            countTot = countTot + count;
        end
    end
    actionsCountCell{1,action} = round(countTot ./ nSample);
    variableNames{1,action} = char(curName);
end

actionsCountMean = cell2table(actionsCountCell, 'VariableNames', variableNames);

end

