function selfletPlotActiveSelflets( activeSelflets, sendToPlotly )

minute = 60000;
Xdata = activeSelflets.timestamp ./ minute;
Ydata = activeSelflets.selflets;
selfletCreateFigureActiveSelflets(Xdata, Ydata, max(Xdata), sendToPlotly);

end