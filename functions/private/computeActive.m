[activeSelflets, startTime, endTime] = selfletReadActiveSelflets(sampleActive, durationTest, startSelflets);
if(durationTest == 0)
   duration = (endTime - startTime)/(3600*1000) * 3600;
else
    duration = durationTest;
end
activeSelflets5min = selfletActiveTimeAvg(activeSelflets, 300);
activeSelflets10min = selfletActiveTimeAvg(activeSelflets, 600);