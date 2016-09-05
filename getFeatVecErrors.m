function errs = getFeatVecErrors( normTestFeats , normPredictedFeats )

errs = zeros(size(normTestFeats,2),1);

for i = 1:size(normTestFeats,2)
    trueFeat = normTestFeats(:,i);
    predFeat = normPredictedFeats(:,i);
    combI = intersect(find(isfinite(trueFeat)),find(isfinite(predFeat)));
    err = norm(predFeat(combI) - trueFeat(combI)) / norm(trueFeat(combI));
    errs(i) = err;
end

end

