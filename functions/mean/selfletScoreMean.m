function scoreMean = selfletScoreMean( scoreCell )

nSample = length(scoreCell);
scoreMean = scoreCell{1};

for sample = 1:nSample
    reqs = scoreCell{sample}{1,:};
    violations = scoreCell{sample}{2,:};
    violationScore = scoreCell{sample}{3,:};
    if(sample == 1)
        reqsTotal = reqs;
        violationsTotal = violations;
        violationScoreTotal = violationScore;
    else
        reqsTotal = reqsTotal + reqs;
        violationsTotal = violationsTotal + violations;
        violationScoreTotal = violationScoreTotal + violationScore;
    end
end

scoreMean{1,:} = round(reqsTotal ./ nSample);
scoreMean{2,:} = violationsTotal ./ nSample;
scoreMean{3,:} = violationScoreTotal ./ nSample;

end

