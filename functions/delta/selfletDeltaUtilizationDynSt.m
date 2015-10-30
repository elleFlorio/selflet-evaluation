function deltaUtilizationDynSt = selfletDeltaUtilizationDynSt( utilizationDyn, utilizationSt )

hDyn = height(utilizationDyn);
hSt= height(utilizationSt);

if(hDyn <= hSt)
    limit = hDyn;
    deltaUtilizationDynSt = utilizationDyn;
else
    limit = hSt;
    deltaUtilizationDynSt = utilizationSt;
end

deltaUtilizationDynSt.selflets = [];
deltaUtilizationDynSt.utilization = utilizationDyn.utilization(1:limit) - utilizationSt.utilization(1:limit);

end

