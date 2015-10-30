% Prepare files path
pathActive = [dataPath 'active*.csv'];
pathRt = [dataPath 'all_results*.csv'];
pathAct = [dataPath 'all_actions*.csv'];
pathReq = [dataPath 'requests*.csv'];
pathLife = [dataPath 'all_life*.csv'];
pathStart = [dataPath 'all_start*.csv'];
pathEnd = [dataPath 'all_end*.csv'];
pathCpu = [dataPath 'all_cpu*.csv'];


% List files
fileActive = dir(pathActive);
fileRt = dir(pathRt);
fileAct = dir(pathAct);
fileReq = dir(pathReq);
fileLife = dir(pathLife);
fileStart = dir(pathStart);
fileEnd = dir(pathEnd);
fileCpu = dir(pathCpu);

% Prepare the struct for the samples
nSamples = length(fileRt); %should be the same for everything
selfletResults = struct('sample', [], 'duration', [],...
    'active', [], 'active5min', [], 'active10min', [],...
    'rt', [], 'rt5min', [], 'rt10min', [],...
    'reqs', [], 'reqs5min', [], 'reqs10min', [], 'reqsSelflet', [],...
    'score', [], 'score5min', [], 'score10min', [],...
    'scoreReq', [], 'scoreReq5min', [], 'scoreReq10min', [],...
    'actions', [], 'actions5min', [], 'actions10min', [], ...
    'utilization', [], 'utilization5min', [], 'utilization10min', [], 'utilizationSelflet', [],...
    'started', [], 'started30min', [], 'started60min', [],...
    'ended', [], 'ended30min', [], 'ended60min', [],...
    'lifetime', [], 'costsEvalSelflet', [], 'cost', []);

% Prepare the setting
servicesNames = selfletCreateServicesNames;
nServices = length(servicesNames);
servicesMaxRt = selfletCreateMaxRtTable;
actionLabels = {'ADD_SELFLET' 'REMOVE_SELFLET' 'TEACH_SERVICE' 'CHANGE_SERVICE_IMPLEMENTATION' 'REDIRECT_SERVICE'};

% Prepare the matrix
scoreTotReqSum = zeros(1,nServices);
scoreViolsSum = zeros(1,nServices);
score1minTotReqSum = zeros(1,nServices);
score1minViolsSum = zeros(1,nServices);
score5minTotReqSum = zeros(1,nServices);
score5minViolsSum = zeros(1,nServices);