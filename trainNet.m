clear all;

load('datasets.mat','normTrainFeats','trainSigs');

% Train network
net = newgrnn(normTrainFeats,trainSigs,0.05);

%net = newrbe(normTrainFeats,trainSigs,0.1);

% hiddenNeurons = 10;
% net = fitnet(hiddenNeurons,'trainbfg');
% net.trainParam.epochs = 1000;
% net = train(net,normTrainFeats,trainSigs,'useParallel','yes','showResources','yes');

save('trainedNet.mat','net');
