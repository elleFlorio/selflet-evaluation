function selfletPlotMultiActive( dynamic, static, reference, duration, sendToPlotly )

minute = 60000;
dims = [length(dynamic.selflets) length(static.selflets) length(reference.selflets)];
minDim = min(dims);
Xdata = dynamic.timestamp(1:minDim) ./ minute;
Ydata = [dynamic.selflets(1:minDim) static.selflets(1:minDim) reference.selflets(1:minDim)];

selfletCreateFigureActiveSelflets(Xdata, Ydata, duration, sendToPlotly);
legend('Dynamic', 'Static', 'Baseline', 'Location','northwest');

end