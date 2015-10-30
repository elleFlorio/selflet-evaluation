function [ lifeStart, lifeEnd, lifeTotal ] = selfletReadLife( fileStart, fileEnd, fileLife, startTime, endTime)

lifeStartTable = readtable(fileStart, 'Format', '%u64%d');
lifeEndTable = readtable(fileEnd, 'Format', '%u64%d');
lifeTotalTable = readtable(fileLife, 'Format', '%u64%d%u64%u64%u64');

lifeStart = sortrows(lifeStartTable,'timestamp','ascend');
lifeEnd = sortrows(lifeEndTable,'timestamp','ascend');

lastEnd = max(lifeEnd.('timestamp'));
if(lastEnd > endTime)
    endTime = lastEnd;
end

notEnded = setdiff(lifeStart.selflet, lifeTotalTable.selflet);


for missingSelflet = 1:length(notEnded)
    timestamp = endTime;
    selflet = notEnded(missingSelflet);
    selfletRowIndex = lifeStart.('selflet') == selflet;
    selfletRow = lifeStart(selfletRowIndex,:);
    started = selfletRow.timestamp;
    ended = endTime;
    lifetime = ended - started;
    newRow = table(timestamp, selflet, started, ended, lifetime);
    lifeTotalTable = [lifeTotalTable;newRow];
end

lifeTotal = sortrows(lifeTotalTable,'selflet','ascend');

lifeStart.timestamp = lifeStart.timestamp - startTime;
lifeEnd.timestamp = lifeEnd.timestamp - startTime;

lifeTotal.timestamp = lifeTotal.timestamp - startTime;
lifeTotal.started = lifeTotal.started - startTime;
lifeTotal.ended = lifeTotal.ended - startTime;

end

