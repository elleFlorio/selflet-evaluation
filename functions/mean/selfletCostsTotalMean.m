function costsTotalMean = selfletCostsTotalMean( costsTotalCell )

nSample = length(costsTotalCell);
costsTotalArray = zeros(nSample,1);

for sample = 1:nSample
    costsTotalArray(sample) = costsTotalCell{sample};
end

costsTotalMean = mean(costsTotalArray);

end

