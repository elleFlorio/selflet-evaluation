function selfletCreateFigureReqs(Xdata, Ydata, figureTitle, duration, sendToPlotly)
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontSize',30);
xlim(axes1,[1 duration]);
ylim(axes1,[0 150]);
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to plot
plot1 = plot(Xdata,Ydata,'LineWidth',4);
set(plot1(end),'Color',[1 0 0]);

% Create xlabel
xlabel('Time [m]','FontWeight','bold','FontSize',34);

% Create ylabel
ylabel('Time [s]','FontWeight','bold','FontSize',34);

% Create title
title(figureTitle,'FontWeight','bold','FontSize',34);

if(sendToPlotly)
    fig2plotly()
end

end