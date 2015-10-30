function costEvalMean = selfletCostsMean( costEvalCell )

nSample = length(costEvalCell);
costEvalMean = costEvalCell{1};
costEvalMean.selflets = [];

for sample = 1:nSample
    instances = costEvalCell{sample}.instances;
    cost = costEvalCell{sample}.cost;
    if(sample == 1)
        instancesTotal = instances;
        costTotal = cost;
    else
        instancesTotal = instancesTotal + instances;
        costTotal = costTotal + cost;
    end
end

costEvalMean.instances = instancesTotal ./ nSample;
costEvalMean.cost = costTotal ./ nSample;

end

