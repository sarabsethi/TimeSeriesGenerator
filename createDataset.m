function [sigs, feats] = createDataset( sigLength, featLength, datasetLength )
%CREATEDATASET Summary of this function goes here

sigs = zeros(sigLength,datasetLength);
feats = zeros(featLength,datasetLength);


for i = 1:datasetLength
    [sigs(:,i),f,phase,A,noiseA] = genSignal;
    %feats(:,i) = genHctsaFeatVec(sigs(:,i));
    feats(:,i) = [f, phase, A, noiseA];
end

end

