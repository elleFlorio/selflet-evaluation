[resultsTable, servicesRt] = selfletReadResults(sampleRes, startTime, duration, servicesNames);
servicesRt5min = selfletServicesTimeAvg(servicesRt,duration,300);
servicesRt10min = selfletServicesTimeAvg(servicesRt,duration,600);