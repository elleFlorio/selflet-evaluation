function selfletCreateFigureUtilizationSelfletAvg(Xdata, Ydata, sendToPlotly)
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontSize',30);
xlim(axes1,[1 length(Xdata)]);
ylim(axes1,[0 1]);
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to plot
bar1 = bar(Xdata,Ydata,'LineWidth',4);

% Create xlabel
xlabel('Selflet','FontWeight','bold','FontSize',34);

% Create ylabel
ylabel('CPU utilization','FontWeight','bold','FontSize',34);

%Title
title('CPU utilization average','FontWeight','bold','FontSize',34)

if(sendToPlotly)
    fig2plotly()
end

end