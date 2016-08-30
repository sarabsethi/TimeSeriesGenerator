function [sigs, feats] = createHctsaDataset(hctsaFile, minSigLength , tsIdxs)
%CREATEHCTSADATASET Create dataset from HCTSA file

load(hctsaFile);

nOps = 100;
nTS = length(tsIdxs);
%tsIdxs = datasample(1:length(TimeSeries),nTS);

sigs = zeros(minSigLength,nTS);
feats = zeros(nOps,nTS);
for i = 1:nTS
    sigs(:,i) = TimeSeries(tsIdxs(i)).Data(1:minSigLength);
    feats(:,i) = TS_DataMat(tsIdxs(i),1:nOps);
end

end

