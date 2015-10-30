function servicesRtMean = selfletServicesRtMean( servicesCellTimeAvg )

nSample = length(servicesCellTimeAvg);
nServices = length(servicesCellTimeAvg{1});
servicesRtMean = servicesCellTimeAvg{1};

for service = 1:nServices
    for sample = 1:nSample
        serviceRt = servicesCellTimeAvg{sample}{service}.rt;
        serviceReq = servicesCellTimeAvg{sample}{service}.numberOfReqs;
        if(sample == 1)
            serviceRtTotal = serviceRt;
            serviceReqTot = serviceReq;
        else
            serviceRtTotal = serviceRtTotal + serviceRt;
            serviceReqTot = serviceReqTot + serviceReq;
        end
    end
    serviceRtMean = serviceRtTotal ./ nSample;
    serviceReqMean = serviceReqTot ./ nSample;
    servicesRtMean{service}.rt = serviceRtMean;
    servicesRtMean{service}.numberOfReqs = serviceReqMean;
end

end

