clear all;

load('auto_chosen_ops_43.mat','autoChosenOps');

opIds = [autoChosenOps.ID];
trainIdxs = 1:800;
testIdxs = 815:820;
sigLength = 150;

% Create training dataset
[trainSigs, trainFeats] = createHctsaDataset('HCTSA_sine.mat',...
    sigLength,trainIdxs,opIds);
[normTrainFeats,normInfo] = normaliseFeatVec(trainFeats);

% Create testing dataset
[testSigs, testFeats] = createHctsaDataset('HCTSA_sine.mat',sigLength,...
    testIdxs,opIds);
normTestFeats = normaliseFeatVec(testFeats,normInfo);

save('datasets.mat','trainFeats','trainSigs','normTrainFeats',...
    'testFeats','testSigs','normTestFeats',...
    'normInfo','opIds','sigLength');
