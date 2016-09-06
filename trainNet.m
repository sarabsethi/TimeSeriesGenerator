clear all;

createNewNet = false;

load('datasets.mat','normTrainFeats','trainSigs');

% Train network
% net = newgrnn(normTrainFeats,trainSigs,0.01);

% net = newrbe(normTrainFeats,trainSigs,1);

if createNewNet
    hiddenNeurons = [100,100];
    net = fitnet(hiddenNeurons,'trainscg');
    net.trainParam.epochs = 1000000;
    
    net.divideParam.trainRatio = 1;
    net.divideParam.valRatio = 0;
    net.divideParam.testRatio = 0;
else
    load('trainedNet.mat');
end

%[X,Xi,Ai,T] = preparets(net,normTrainFeats,{},trainSigs);
%Xg = nndata2gpu(normTrainFeats);
%Tg = nndata2gpu(trainSigs);

net = train(net,normTrainFeats,trainSigs,'useParallel','yes','useGPU','no',...
    'CheckpointFile','checkpoint.mat');

save('trainedNet.mat','net');