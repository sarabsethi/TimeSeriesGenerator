clear all;

load('trainedNet.mat');
load('trainDataSet.mat');

testSigIdxs = 800:850;
sigLength = 150;
featLength = 4;

[testSigs, testFeats] = createHctsaDataset('HCTSA_sine.mat',...
    sigLength,testSigIdxs);
normTestFeats = normaliseFeatVec(testFeats,normInfo);

knn_idxs = knnsearch(trainFeats',testFeats');
nearestSigs = trainSigs(:,knn_idxs);

predictedTestSigs = sim(net,normTestFeats);

for i = 1:5
    subplot(3,5,i);
    plot(testSigs(:,i));
    title(sprintf('Real signal %i',i));
    
    subplot(3,5,i+5);
    plot(predictedTestSigs(:,i));
    title(sprintf('Generated signal %i',i));
    
    subplot(3,5,i+10);
    plot(nearestSigs(:,i));
    title(sprintf('Nearest neighbour result %i',i));
end