clear all;

load('auto_chosen_ops_43.mat','autoChosenOps');

opIds = [autoChosenOps.ID];
trainIdxs = 1:800;
testIdxs = 815:820;
sigLength = 150;
hctsaFile = 'HCTSA_sine.mat';

% Create training dataset
[trainSigs, trainFeats] = createHctsaDataset(hctsaFile,...
    sigLength,trainIdxs,opIds);

% trainFeats = calcAlexFeats(trainSigs);

[normTrainFeats,normInfo] = normaliseFeatVec(trainFeats);

% Create testing dataset
[testSigs, testFeats] = createHctsaDataset(hctsaFile,sigLength,...
    testIdxs,opIds);

% testFeats = calcAlexFeats(trainSigs);

normTestFeats = normaliseFeatVec(testFeats,normInfo);

save('datasets.mat','trainFeats','trainSigs','normTrainFeats',...
    'testFeats','testSigs','normTestFeats',...
    'normInfo','opIds','sigLength');
