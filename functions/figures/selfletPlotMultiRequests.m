function selfletPlotMultiRequests( dynamic, static, reference, maxRt, duration, sendToPlotly )

minute = 60000;
serviceName = char(dynamic.service(1));
serviceMaxRt(1:height(dynamic),1) = maxRt{serviceName, :};

Xdata = dynamic.timestamp ./ minute;
Ydata = [dynamic.rt./1000 static.rt./1000 reference.rt./1000 serviceMaxRt/1000];

selfletCreateFigureReqs(Xdata,Ydata, serviceName, duration, sendToPlotly);
legend('Dynamic','Static','Baseline','Max Response Time','Location','northeast');

end