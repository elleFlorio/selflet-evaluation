function selfletPlotLifetime(lifeTable, sendToPlotly)

Xdata = lifeTable.selflet;
Ydata = lifeTable.lifetime ./ 60000;

selfletCreateFigureLifetime(Xdata, Ydata, sendToPlotly);

end