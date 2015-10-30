function deltaScalingDynSt = selfletDeltaScalingDynSt( scalingDyn, scalingSt )

hDyn = height(scalingDyn);
hSt= height(scalingSt);

if(hDyn <= hSt)
    limit = hDyn;
    deltaScalingDynSt = scalingDyn;
else
    limit = hSt;
    deltaScalingDynSt = scalingSt;
end

deltaScalingDynSt.selflets = [];
deltaScalingDynSt.count = scalingDyn.count(1:limit) - scalingSt.count(1:limit);

end

