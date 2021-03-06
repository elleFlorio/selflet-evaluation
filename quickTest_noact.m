servicesNames = selfletCreateServicesNames;
servicesMaxRt = selfletCreateMaxRtTable;
duration = 12600;
startSelflets = 50;
[activeSelflets_noact, startTime_noact] = selfletReadActiveSelflets('run/final/step/noaction/activeSelflets.csv', duration, startSelflets);
[ resultsTable_noact, servicesRt_noact ] = selfletReadResults('run/final/step/noaction/all_results.csv', startTime_noact, duration, servicesNames);
score_noact = selfletComputeScores(servicesRt_noact,servicesMaxRt);
[score5min_noact srt5m_noact] = selfletComputeScoresWithTimeMean(servicesRt_noact, servicesMaxRt, 300);
[score1min_noact srt1m_noact] = selfletComputeScoresWithTimeMean(servicesRt_noact, servicesMaxRt, 60);
selfletPlotServiceTableRt(servicesRt_noact{13},servicesMaxRt, 1000);