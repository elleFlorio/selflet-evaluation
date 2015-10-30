function selfletPlotData(data, useActions, isMean, sendToPlotly)

maxRt = selfletCreateMaxRtTable;

% Plot active
selfletPlotActiveSelflets(data.active5min, sendToPlotly);

% Plot requests 
selfletPlotRequests(data.reqs5min, maxRt, sendToPlotly);

if(useActions)
    % Plot actions pie
    selfletPlotAllActionsPie(data.actions, sendToPlotly);

    if(~isMean)
        % Plot lifetime
        selfletPlotLifetime(data.lifetime, sendToPlotly);

        % Plot scaling
        selfletPlotScaling(data.started30min, data.ended30min, data.duration, sendToPlotly);
    end
end

% Plot utilization in time
selfletPlotUtilizationTimeAvg(data.utilization5min, sendToPlotly);

if(~isMean)
    % Plot utilization per selflet
    selfletPlotUtilizationSelfletAvg(data.utilizationSelflet, sendToPlotly)
end

end