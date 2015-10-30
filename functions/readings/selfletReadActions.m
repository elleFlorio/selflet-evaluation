function [ actions_dn ] = selfletReadActions( file, actionsLabels, startTime, duration )

actionsTable = readtable(file, 'Format', '%u64%C');
actionsTable.timestamp = actionsTable.timestamp - startTime;
durationMsec = duration * 1000;
inTimeRows = actionsTable.timestamp <= durationMsec;
actionsTable = actionsTable(inTimeRows,:);
numberOfActions = length(actionsLabels);
actions_dn = cell(1,numberOfActions);

for cur_action = 1:numberOfActions
    actionName = actionsLabels{cur_action};
    currentActionFilter = actionsTable.action == actionName;
    currentAction = actionsTable(currentActionFilter,:);
    currentAction = sortrows(currentAction,'timestamp','ascend');
    actions_dn{1,cur_action} = currentAction;
end


end