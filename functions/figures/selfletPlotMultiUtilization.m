function selfletPlotMultiUtilization( dynamic, static, reference, duration, sendToPlotly )

minute = 60000;
Xdata = dynamic.timestamp ./ minute;
Ydata = [dynamic.utilization static.utilization reference.utilization];

selfletCreateFigureUtilizationTimeAvg(Xdata, Ydata, duration, sendToPlotly)
legend('Dynamic', 'Static', 'Baseline','Location','northeast');

end

