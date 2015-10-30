function deltaDynSt = selfletDeltaDynSt( dynamic, static )

% Delta active
activeDelta5min = selfletDeltaActiveDynSt(dynamic.active5min, static.active5min);
activeDelta10min = selfletDeltaActiveDynSt(dynamic.active10min, static.active10min);

% Delta score services
scoreDelta5min = selfletDeltaScoreDynSt(dynamic.score5min, static.score5min);
scoreDelta10min = selfletDeltaScoreDynSt(dynamic.score10min, static.score10min);

% Delta score requests
scoreReqDelta5min = selfletDeltaScoreDynSt(dynamic.scoreReq5min, static.scoreReq5min);
scoreReqDelta10min = selfletDeltaScoreDynSt(dynamic.scoreReq10min, static.scoreReq10min);

%Delta utilization
utilizationDelta5min = selfletDeltaUtilizationDynSt(dynamic.utilization5min, static.utilization5min);
utilizationDelta10min = selfletDeltaUtilizationDynSt(dynamic.utilization10min, static.utilization10min);

% Delta cost
costDelta = dynamic.cost - static.cost;

% Populate struct
deltaDynSt.('active5min') = activeDelta5min;
deltaDynSt.('active10min') = activeDelta10min;
deltaDynSt.('score5min') = scoreDelta5min;
deltaDynSt.('score10min') = scoreDelta10min;
deltaDynSt.('scoreReq5min') = scoreReqDelta5min;
deltaDynSt.('scoreReq10min') = scoreReqDelta10min;
deltaDynSt.('utilization5min') = utilizationDelta5min;
deltaDynSt.('utilization10min') = utilizationDelta10min;
deltaDynSt.('cost') = costDelta;

end

