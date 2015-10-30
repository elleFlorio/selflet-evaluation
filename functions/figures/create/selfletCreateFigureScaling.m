function selfletCreateFigureScaling( Xdata, Ydata, Xlimit, sendToPlotly)

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontSize',30);
xlim(axes1,[0 Xlimit]);
%ylim(axes1,[0 30]);
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to plot
bar1 = bar(Xdata,Ydata);

% Create xlabel
xlabel('Time [m]','FontWeight','bold','FontSize',34);

% Create ylabel
ylabel('Selflets','FontWeight','bold','FontSize',34);

%Title
title('Scaling','FontWeight','bold','FontSize',34)

legend('Started','Ended');

if(sendToPlotly)
    fig2plotly()
end

end

