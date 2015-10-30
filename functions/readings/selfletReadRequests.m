function requests = selfletReadRequests( file, startTime )

requestsTable = readtable(file, 'Format', '%u64%C%u64%d%d');
requestsTable.timestamp = requestsTable.timestamp - startTime;
requests = sortrows(requestsTable,'timestamp','ascend');

end

