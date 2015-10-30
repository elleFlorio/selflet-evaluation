actions = selfletReadActions(sampleAct, actionLabels, startTime, duration);
actions5min = selfletActionsTimeAvg(actions, duration, 300);
actions10min = selfletActionsTimeAvg(actions, duration, 600);