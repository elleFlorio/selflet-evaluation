function selfletCreateFigureActiveSelflets(Xdata, Ydata, duration, sendToPlotly)
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontSize',30);
xlim(axes1,[1 duration]);
ylim(axes1,[0 60]);
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to plot
plot1 = plot(Xdata,Ydata,'LineWidth',4);

% Create xlabel
xlabel('Time [m]','FontWeight','bold','FontSize',34);

% Create ylabel
ylabel('Active SelfLets','FontWeight','bold','FontSize',34);

%Title
title('Active SelfLets over time','FontWeight','bold','FontSize',34)

if(sendToPlotly)
    fig2plotly();
end

end