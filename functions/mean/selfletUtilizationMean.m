function utilizationMean = selfletUtilizationMean( utilizationCell )

nSample = length(utilizationCell);
utilizationMean = utilizationCell{1};
utilizationMean.selflets = [];

for sample = 1:nSample
    cpu = utilizationCell{sample}.utilization;
    if(sample == 1)
        cpuTot = cpu;
    else
        cpuTot = cpuTot + cpu;
    end
end

utilizationMean.utilization = cpuTot ./ nSample;

end

