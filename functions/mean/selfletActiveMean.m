function activeMean = selfletActiveMean( activeSelfletsCell )

nSample = length(activeSelfletsCell);
heightMax = 0;
sampleMax = 0;
for sample = 1:nSample
    curHeight = height(activeSelfletsCell{sample});
    if(curHeight > heightMax)
        heightMax = curHeight;
        sampleMax = sample;
    end
end
activeMean = activeSelfletsCell{sampleMax};

for sample = 1:nSample
    active = activeSelfletsCell{sample}.selflets;
    if(length(active) < heightMax)
        active = cat(1,activeMean.selflets(length(active)+1:heightMax),active);
    end
    if(sample == 1)
        activeTotal = active;
    else
        activeTotal = activeTotal + active;
    end
end

activeMean.selflets = round(activeTotal ./ nSample);

end

