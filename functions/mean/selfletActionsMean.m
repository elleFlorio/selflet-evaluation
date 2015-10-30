function actionsMean = selfletActionsMean(actionsCellTimeAvg)

nSample = length(actionsCellTimeAvg);
nActions = length(actionsCellTimeAvg{1});
actionsMean = actionsCellTimeAvg{1};

for action = 1:nActions
    for sample = 1:nSample
        newAction = actionsCellTimeAvg{sample}{action};
        count = newAction.numberOfActions;
        if(sample == 1)
            countTot = count;
        else
            countTot = countTot + count;
        end
    end
    newAction.numberOfActions = countTot ./ nSample;
    actionsMean{action} = newAction;
end


end

