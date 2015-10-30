selfletResults(iSample).('sample') = iSample;
selfletResults(iSample).('duration') = duration;
selfletResults(iSample).('active') = activeSelflets;
selfletResults(iSample).('active5min') = activeSelflets5min;
selfletResults(iSample).('active10min') = activeSelflets10min;
selfletResults(iSample).('rt') = servicesRt;
selfletResults(iSample).('rt5min') = servicesRt5min;
selfletResults(iSample).('rt10min') = servicesRt10min;
selfletResults(iSample).('reqs') = requests;
selfletResults(iSample).('reqs5min') = requests5min;
selfletResults(iSample).('reqs10min') = requests10min;
selfletResults(iSample).('reqsSelflet') = requestsSelflet;
selfletResults(iSample).('score') = scoreServices;
selfletResults(iSample).('score5min') = scoreServices5min;
selfletResults(iSample).('score10min') = scoreServices10min;
selfletResults(iSample).('scoreReq') = scoreReqs;
selfletResults(iSample).('scoreReq5min') = scoreReqs5min;
selfletResults(iSample).('scoreReq10min') = scoreReqs10min;
selfletResults(iSample).('utilization') = utilization;
selfletResults(iSample).('utilization5min') = utilization5min;
selfletResults(iSample).('utilization10min') = utilization10min;
selfletResults(iSample).('utilizationSelflet') = utilizationSelflet;
selfletResults(iSample).('costsEvalSelflet') = costEvalSelflet;
selfletResults(iSample).('cost') = costTotal;
if useActions
    selfletResults(iSample).('actions') = actions;
    selfletResults(iSample).('actions5min') = actions5min;
    selfletResults(iSample).('actions10min') = actions10min;
    selfletResults(iSample).('started') = started;
    selfletResults(iSample).('started30min') = started30min;
    selfletResults(iSample).('started60min') = started60min;
    selfletResults(iSample).('ended') = ended;
    selfletResults(iSample).('ended30min') = ended30min;
    selfletResults(iSample).('ended60min') = ended60min;
    selfletResults(iSample).('lifetime') = lifetime;
end