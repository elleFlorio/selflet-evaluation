function selfletPlotActionTable( actionTableTime, duration, sendToPlotly )

actionName = char(actionTableTime.action(1));
actionName = strrep(actionName,'_',' ');
actionName = lower(actionName);
Xvalues = actionTableTime.timestamp ./ 1000;
Xlimit = duration;
Yvalues = actionTableTime.numberOfActions;
Ylimit = max(Yvalues);

selfletCreateFigureAction(Xvalues,Yvalues,Xlimit,Ylimit,actionName,sendToPlotly);

end