[started, ended, lifetime] = selfletReadLife(sampleStart, sampleEnd, sampleLife, startTime, endTime);
started30min = selfletScalingTimeAvg(started, duration, 1800);
started60min = selfletScalingTimeAvg(started, duration, 3600);
ended30min = selfletScalingTimeAvg(ended, duration, 1800);
ended60min = selfletScalingTimeAvg(ended, duration, 3600);