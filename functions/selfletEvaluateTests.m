function results = selfletEvaluateTests( dataPath, durationTest, startSelflets, instanceCost, useActions )

% Execute the setup
setup

for iSample = 1:nSamples
    % Get the samples
    getSamples;
    % Active Selflets
    computeActive;
    % Services Response Time
    computeServicesRt;
    % Requets Response Time
    computeRequests;
    % Score
    computeServicesScores;
    % Score of requests
    computeScoreRequests;
    % Utilization
    computeUtilization;
    % Lifetime
    computeLifetime;
    % Costs evaluation
    computeCosts;
    % Actions
    if useActions
        computeActions;
    end
    
    % Populate struct
    populateStruct;
end

results = selfletResults;

end

