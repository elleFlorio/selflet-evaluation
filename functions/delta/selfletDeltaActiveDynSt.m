function deltaActiveDynSt = selfletDeltaActiveDynSt( activeDyn, activeSt )

hDyn = height(activeDyn);
hSt= height(activeSt);

if(hDyn <= hSt)
    limit = hDyn;
    deltaActiveDynSt = activeDyn;
else
    limit = hSt;
    deltaActiveDynSt = activeSt;
end

deltaActiveDynSt.selflets = activeDyn.selflets(1:limit) - activeSt.selflets(1:limit);

end

