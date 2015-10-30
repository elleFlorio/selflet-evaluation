function selfletPlotUtilizationTimeAvg( utilizationTableTimeAvg, sendToPlotly )

minute = 60000;
Xdata = utilizationTableTimeAvg.timestamp ./ minute;
Ydata = utilizationTableTimeAvg.utilization;
selfletCreateFigureUtilizationTimeAvg(Xdata, Ydata, max(Xdata), sendToPlotly)

end