function selfletPlotMultiActionsPie(dynamic, static, sendToPlotly)

if(istable(dynamic))
    numberOfActions = width(dynamic);
    labels = dynamic.Properties.VariableNames;
else
    numberOfActions = length(dynamic);
    labels = cell(numberOfActions, 1);
end

Xdynamic = zeros(numberOfActions,1);
Xstatic = zeros(numberOfActions,1);
explode = ones(numberOfActions,1);

for action = 1:numberOfActions
    if(istable(dynamic))
        Xdynamic(action) = dynamic{1,action};
        Xstatic(action) = static{1, action};
        labels{action} = lower(strrep(labels{action}, '_', ' '));
    else
        Xdynamic(action) = height(dynamic{action});
        Xstatic(action) = height(static{action});
        labels{action} = lower(strrep(char(dynamic{action}.action(1)), '_', ' '));
    end
end

fig = figure;
subplot(1,2,1)
h = pie(Xdynamic,explode);
title('Actions dynamic','FontSize',14);
%legend(labels,'Location','northeastoutside','Orientation','vertical','FontSize',20);
hText = findobj(h,'Type','text'); % text object handles
set(hText,'FontSize',20);

subplot(1,2,2)
h = pie(Xstatic,explode);
title('Actions static','FontSize',14);
legend(labels,'Location','southeastoutside','Orientation','vertical','FontSize',14);
hText = findobj(h,'Type','text'); % text object handles
set(hText,'FontSize',20);

%mtit(fig, 'SelfLets Actions','FontWeight','bold','FontSize',34,'xoff',0,'yoff',-.1);

if(sendToPlotly)
    fig2plotly()
end


end

