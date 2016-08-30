clear all;

trainIdxs = 1:500;
sigLength = 150;
hiddenNeurons = 10;

[trainSigs, trainFeats] = createHctsaDataset('HCTSA_sine.mat',...
    sigLength,trainIdxs);
[normTrainFeats,normInfo] = normaliseFeatVec(trainFeats);

save('trainDataSet.mat','trainFeats','trainSigs','normTrainFeats','normInfo');

net = newgrnn(normTrainFeats,trainSigs,0.01);
%net = newrbe(normTrainFeats,trainSigs);

% net = fitnet(hiddenNeurons,'trainbfg');
% net.trainParam.epochs = 1000;
% net = train(net,normTrainFeats,trainSigs,'useParallel','yes','showResources','yes');

save('trainedNet.mat','net');
