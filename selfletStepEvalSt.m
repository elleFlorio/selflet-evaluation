%duration = 14400
stepStatic = selfletEvaluateTests( 'run/final/step/static/', 14400, 3, 0.0161, true);
stepStatic(end+1) = selfletTestsMean(stepStatic, true);