%duration = 14400
stepDynamic = selfletEvaluateTests( 'run/final/step/dynamic/', 14400, 3, 0.0161, true);
stepDynamic(end+1) = selfletTestsMean(stepDynamic, true);
