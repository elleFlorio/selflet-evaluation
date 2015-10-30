function reqScore = selfletComputeReqScore( reqTable, maxRtTable )

serviceName = char(reqTable.service(1));
limit = maxRtTable.('servicesMaxRt')(serviceName);
scoreCell = cell(3,1);
scoreRows = {'Total reqs' 'Violations' 'Violation score'};
scoreHeaders = cell(1,1);

violationRows = reqTable.rt > limit;
violations = sum(violationRows);
total = sum(reqTable.numberOfReqs);
score = violations * 100 / total;

scoreCell{1,1} = total;
scoreCell{2,1} = violations;
scoreCell{3,1} = score;
scoreHeaders{1,1} = serviceName;

reqScore = cell2table(scoreCell, 'VariableNames', scoreHeaders, 'RowNames', scoreRows);

end