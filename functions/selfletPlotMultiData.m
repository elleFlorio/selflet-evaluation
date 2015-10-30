function selfletPlotMultiData( dynamic, static, reference, sendToPlotly )

maxRt = selfletCreateMaxRtTable;
duration = dynamic.duration / 60;
% Plot active
selfletPlotMultiActive(dynamic.active5min, static.active5min, reference.active5min, duration, sendToPlotly);

% Plot requests 
selfletPlotMultiRequests(dynamic.reqs5min, static.reqs5min, reference.reqs5min, maxRt, duration, sendToPlotly);

% Plot utilization in time
selfletPlotMultiUtilization(dynamic.utilization5min, static.utilization5min, reference.utilization5min, duration, sendToPlotly);

% Plot actions pie
selfletPlotMultiActionsPie(dynamic.actions, static.actions, sendToPlotly);


end