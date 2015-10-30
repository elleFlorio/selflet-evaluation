function [costEvalSelflets, costTotal] = selfletComputeCostSelflet( lifeTable, instanceCost )

hour = 60000 * 60;
selflet = 0;
hours = 0;
cost = 0;
costEvalSelflets = table(selflet, hours, cost);

nSelflet = height(lifeTable);
for c_selflet = 1:nSelflet
    selflet = lifeTable.selflet(c_selflet);
    hours = double(ceil(lifeTable.lifetime(c_selflet) / hour));
    cost = hours * instanceCost;
    newRow = table(selflet, hours, cost);
    costEvalSelflets = [costEvalSelflets;newRow];
end

costEvalSelflets(1,:) = [];
costTotal = sum(costEvalSelflets.cost);

end

