function [ maxRtTable ] = selfletCreateMaxRtTable()

servicesMaxRt = selfletMakeServicesMaxRespTime;
servicesNames = selfletCreateServicesNames;
maxRtTable = table(servicesMaxRt, 'RowNames', servicesNames);

end

