function selfletPlotRequests(requestsTable, maxRtTable, sendToPlotly)

minute = 60000;
serviceName = char(requestsTable.service(1));
serviceMaxRt(1:height(requestsTable),1) = maxRtTable{serviceName, :};

Xdata = requestsTable.timestamp ./ minute;
Ydata = [requestsTable.rt./1000 serviceMaxRt/1000];

selfletCreateFigureReqs(Xdata,Ydata, serviceName, max(Xdata), sendToPlotly);

end