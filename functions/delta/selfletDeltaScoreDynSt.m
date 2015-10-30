function deltaScoreDynSt = selfletDeltaScoreDynSt( scoreDyn, scoreSt )

deltaScoreDynSt = scoreDyn;

for row = 1:height(scoreDyn)
    deltaScoreDynSt{row,:} = scoreDyn{row,:} - scoreSt{row,:};

end

