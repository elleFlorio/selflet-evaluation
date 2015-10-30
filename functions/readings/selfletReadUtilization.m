function utilization = selfletReadUtilization( path, startTime )

cpuFileName = [path 'all_cpu*.csv'];
cpuFile = dir(cpuFileName);
cpuTable = readtable([path cpuFile.name], 'Format', '%u64%d%f');

utilization = sortrows(cpuTable,'timestamp','ascend');
utilization.timestamp = utilization.timestamp - startTime;

end

