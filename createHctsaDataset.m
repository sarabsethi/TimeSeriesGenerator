function [sigs, feats] = createHctsaDataset(hctsaFile, minSigLength , ...
    tsIdxs, opIds)
%CREATEHCTSADATASET Create dataset from HCTSA file

load(hctsaFile);

nOps = length(opIds);
opIdxs = intersect([Operations.ID],opIds);
nTS = length(tsIdxs);

sigs = zeros(minSigLength,nTS);
feats = zeros(nOps,nTS);
for i = 1:nTS
    sigs(:,i) = TimeSeries(tsIdxs(i)).Data(1:minSigLength);
    feats(:,i) = TS_DataMat(tsIdxs(i),opIdxs);
end

end

