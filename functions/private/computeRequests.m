requests = selfletReadRequests(sampleReq, startTime);
requests5min = selfletRequestsTimeAvg(requests, duration, 300);
requests10min = selfletRequestsTimeAvg(requests, duration, 600);
requestsSelflet = selfletRequestsSelfletAvg(requests);