function selfletCreateFigureAction(Xdata, Ydata, Xlimit, Ylimit, actionName, sendToPlotly)
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontSize',30);
xlim(axes1,[1 Xlimit]);
ylim(axes1,[0 Ylimit]);
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to plot
plot1 = bar(Xdata,Ydata);

% Create xlabel
xlabel('Time [s]','FontWeight','bold','FontSize',34);

% Create ylabel
ylabel('Number of actions','FontWeight','bold','FontSize',34);

%Title
title(actionName,'FontWeight','bold','FontSize',34)

if(sendToPlotly)
    fig2plotly()
end

end