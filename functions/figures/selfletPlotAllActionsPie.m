function percentValues = selfletPlotAllActionsPie(actions, sendToPlotly)

if(istable(actions))
    numberOfActions = width(actions);
    labels = actions.Properties.VariableNames;
else
    numberOfActions = length(actions);
    labels = cell(numberOfActions, 1);
end

X = zeros(numberOfActions,1);
explode = ones(numberOfActions,1);

for action = 1:numberOfActions
    if(istable(actions))
        X(action) = actions{1,action};
        labels{action} = lower(strrep(labels{action}, '_', ' '));
    else
        X(action) = height(actions{action});
        labels{action} = lower(strrep(char(actions{action}.action(1)), '_', ' '));
    end
end

figure;
h = pie(X,explode);

legend(labels,'Location','northeastoutside','Orientation','vertical','FontSize',20);
hText = findobj(h,'Type','text'); % text object handles
set(hText,'FontSize',20);
percentValues = get(hText,'String'); % percent values

if(sendToPlotly)
    fig2plotly()
end

end