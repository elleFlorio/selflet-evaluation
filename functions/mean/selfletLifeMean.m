function lifeMean = selfletLifeMean( startEndTimeAvgCell )

nSample = length(startEndTimeAvgCell);
lifeMean = startEndTimeAvgCell{1};
lifeMean.selflets = [];

for sample = 1:nSample
    count = startEndTimeAvgCell{sample}.count;
    if(sample == 1)
        countTotal = count;
    else
        countTotal = countTotal + count;
    end
end

lifeMean.count = countTotal ./ nSample;


end

