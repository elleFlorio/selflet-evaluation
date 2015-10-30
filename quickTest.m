servicesNames = selfletCreateServicesNames;
servicesMaxRt = selfletCreateMaxRtTable;
actionLabels = {'ADD_SELFLET' 'REMOVE_SELFLET' 'TEACH_SERVICE' 'CHANGE_SERVICE_IMPLEMENTATION' 'REDIRECT_SERVICE'};
duration = 0;
instanceCost = 0.0161;
startSelflets = 3;

[activeSelflets, startTime, endTime] = selfletReadActiveSelflets('run/temp/activeSelflets.csv', duration, startSelflets);
duration = (endTime - startTime)/(3600*1000) * 3600;
active5min = selfletActiveTimeAvg(activeSelflets, 300);
active10min = selfletActiveTimeAvg(activeSelflets, 600);

[resultsTable, servicesRt] = selfletReadResults('run/temp/all_results.csv', startTime, duration, servicesNames);
servicesRt5min = selfletServicesTimeAvg(servicesRt,duration,300);
servicesRt10min = selfletServicesTimeAvg(servicesRt,duration,600);

actions = selfletReadActions('run/temp/all_actions.csv', actionLabels, startTime, duration);
actions5min = selfletActionsTimeAvg(actions, duration, 300);
actions10min = selfletActionsTimeAvg(actions, duration, 600);

[startTable, endTable, lifeTable] = selfletReadLife('run/temp/all_start.csv',...
    'run/temp/all_end.csv','run/temp/all_life.csv',startTime, endTime);
start30min = selfletScalingTimeAvg(startTable, duration, 1800);
start60min = selfletScalingTimeAvg(startTable, duration, 3600);
end30min = selfletScalingTimeAvg(endTable, duration, 1800);
end60min = selfletScalingTimeAvg(endTable, duration, 3600);

utilization = selfletReadUtilization('run/temp/all_cpu.csv', startTime);
utilization5min = selfletUtilizationTimeAvg(utilization, duration, 300);
utilization10min = selfletUtilizationTimeAvg(utilization, duration, 600);
utilizationSelflet = selfletUtilizationSelfletAvg(utilization);

requests = selfletReadRequests('run/temp/requests.csv', startTime);
requests5min = selfletRequestsTimeAvg(requests, duration, 300);
requests10min = selfletRequestsTimeAvg(requests, duration, 600);
requestsSelflet = selfletRequestsSelfletAvg(requests);

scoreServices = selfletComputeScores(servicesRt,servicesMaxRt);
scoreServices5min = selfletComputeScores(servicesRt5min,servicesMaxRt);
scoreServices10min = selfletComputeScores(servicesRt10min,servicesMaxRt);

scoreReqs = selfletComputeReqScore(requests, servicesMaxRt);
scoreReqs5min = selfletComputeReqScore(requests5min, servicesMaxRt);

[costEvalSelfelt costTotal] = selfletComputeCostSelflet(lifeTable, instanceCost);

selfletPlotRequests(requests5min,servicesMaxRt, false);
actionsPerc = selfletPlotAllActionsPie(actions, false);
selfletPlotActiveSelflets(active5min, false);
selfletPlotLifetime(lifeTable, false);
selfletPlotScaling(start30min, end30min, duration);
selfletPlotUtilizationTimeAvg(utilization5min, false);
selfletPlotUtilizationSelfletAvg(utilizationSelflet, false);