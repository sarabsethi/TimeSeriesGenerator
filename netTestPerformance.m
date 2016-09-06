clear all;

load('trainedNet.mat','net');
load('datasets.mat','trainFeats','trainSigs','normTrainFeats',...
    'testFeats','testSigs','normTestFeats',...
    'normInfo','opIds','sigLength');

% Find nearest neighbours to each test feature vector
knn_idxs = knnsearch(normTrainFeats',normTestFeats');
nearestSigs = trainSigs(:,knn_idxs);
normNearestFeats = normTrainFeats(:,knn_idxs);
nearestErrs = getFeatVecErrors(normTestFeats,normNearestFeats);
meanNearestErr = nanmean(nearestErrs);

% Calculate network ouput signals on test feature vectors
predictedSigs = sim(net,normTestFeats);
predictedFeats = calcHctsaFeats(predictedSigs,opIds);
% predictedFeats = calcAlexFeats(predictedSigs);
normPredictedFeats = normaliseFeatVec(predictedFeats,normInfo);
predErrs = getFeatVecErrors(normTestFeats,normPredictedFeats);
meanPredErr = nanmean(predErrs);

fprintf('Mean feature error on %i test signals = %f, nearest neightbours = %f\n',...
    size(testSigs,2),meanPredErr,meanNearestErr);
save('testResults.mat','predictedSigs','predictedFeats','predErrs',...
    'nearestErrs');

% Show first 5 signals vs predictions
for i = 1:5
    subplot(3,5,i);
    ax1 = plot(testSigs(:,i));
    title(sprintf('Real %i',i));
    
    subplot(3,5,i+5);
    plot(predictedSigs(:,i));
    title(sprintf('Generated %i (err = %.3f)',i,predErrs(i)));
    
    subplot(3,5,i+10);
    plot(nearestSigs(:,i));
    title(sprintf('NearestNghb %i  (err = %.3f)',i,nearestErrs(i)));
end