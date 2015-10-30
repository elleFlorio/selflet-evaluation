function selfletPlotScaling( startTable, endTable, duration, sendToPlotly)
Xdata = startTable.timestamp ./ 60000;
Ydata = [startTable.count endTable.count];
durationInMin = duration / 60;
selfletCreateFigureScaling(Xdata, Ydata, durationInMin, sendToPlotly);
end