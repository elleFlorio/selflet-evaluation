function testsMeanStruct = selfletTestsMean( testsEvalStruct, useActions )

testsMeanStruct = testsEvalStruct(1);
testsMeanStruct(:,:) = [];
testsMeanStruct(1).('sample') = 'AVG';
testsMeanStruct(1).('duration') = testsEvalStruct(1).duration;

% Active mean
testsMeanStruct(1).('active') = computeFieldMean(testsEvalStruct, 'active', '');
testsMeanStruct(1).('active5min') = computeFieldMean(testsEvalStruct, 'active', '5min');
testsMeanStruct(1).('active10min') = computeFieldMean(testsEvalStruct, 'active', '10min');

% Serivce response time mean
testsMeanStruct(1).('rt5min') = computeFieldMean(testsEvalStruct, 'rt', '5min');
testsMeanStruct(1).('rt10min') = computeFieldMean(testsEvalStruct, 'rt', '10min');

% Requests mean 
testsMeanStruct(1).('reqs5min') = computeFieldMean(testsEvalStruct, 'reqs', '5min');
testsMeanStruct(1).('reqs10min') = computeFieldMean(testsEvalStruct, 'reqs', '10min');

% Services score mean
testsMeanStruct(1).('score') = computeFieldMean(testsEvalStruct, 'score', '');
testsMeanStruct(1).('score5min') = computeFieldMean(testsEvalStruct, 'score', '5min');
testsMeanStruct(1).('score10min') = computeFieldMean(testsEvalStruct, 'score', '10min');

% Services score mean
testsMeanStruct(1).('scoreReq') = computeFieldMean(testsEvalStruct, 'scoreReq', '');
testsMeanStruct(1).('scoreReq5min') = computeFieldMean(testsEvalStruct, 'scoreReq', '5min');
testsMeanStruct(1).('scoreReq10min') = computeFieldMean(testsEvalStruct, 'scoreReq', '10min');

% Utilization mean
testsMeanStruct(1).('utilization5min') = computeFieldMean(testsEvalStruct, 'utilization', '5min');
testsMeanStruct(1).('utilization10min') = computeFieldMean(testsEvalStruct, 'utilization', '10min');

% Lifetime mean
testsMeanStruct(1).('started30min') = computeFieldMean(testsEvalStruct, 'started', '30min');
testsMeanStruct(1).('started60min') = computeFieldMean(testsEvalStruct, 'started', '60min');
testsMeanStruct(1).('ended30min') = computeFieldMean(testsEvalStruct, 'ended', '30min');
testsMeanStruct(1).('ended60min') = computeFieldMean(testsEvalStruct, 'ended', '60min');

% Costs mean
testsMeanStruct(1).('cost') = computeFieldMean(testsEvalStruct, 'cost', '');

if(useActions)
    % Actions mean
    testsMeanStruct(1).('actions') = computeFieldMean(testsEvalStruct, 'actions', '');
    testsMeanStruct(1).('actions5min') = computeFieldMean(testsEvalStruct, 'actions', '5min');
    testsMeanStruct(1).('actions10min') = computeFieldMean(testsEvalStruct, 'actions', '10min');
end

end

