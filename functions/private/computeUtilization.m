utilization = selfletReadUtilization(sampleCpu, startTime);
utilization5min = selfletUtilizationTimeAvg(utilization, duration, 300);
utilization10min = selfletUtilizationTimeAvg(utilization, duration, 600);
utilizationSelflet = selfletUtilizationSelfletAvg(utilization);