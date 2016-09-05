function feats = calcHctsaFeats( sigs , opIds )

Operations = SQL_add('ops', 'INP_ops.txt', 0, 0);
opIdxs = intersect([Operations.ID],opIds);
Operations = Operations(opIdxs);

feats = zeros(length(opIdxs),size(sigs,2));

for i = 1:size(sigs,2)
    s = sigs(:,i);
    feats(:,i) = TS_CalculateFeatureVector(s,1,Operations);
end

end

