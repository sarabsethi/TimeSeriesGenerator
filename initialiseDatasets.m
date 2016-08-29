nTrainSigs = 200;
nTestSigs = 20;
sigLength = 150;
featLength = 3;

trainSigs = zeros(sigLength,nTrainSigs);
trainFeats = zeros(featLength,nTrainSigs);
for i = 1:nTrainSigs
    [trainSigs(:,i),f,A,noiseA] = genSignal;
    trainFeats(:,i) = [f, A, noiseA];
end

testSigs = zeros(sigLength,nTestSigs);
testFeats = zeros(featLength,nTestSigs);
for i = 1:nTestSigs
    [testSigs(:,i),f,A,noiseA] = genSignal;
    testFeats(:,i) = [f, A, noiseA];
end

net = feedforwardnet(10);
net = train(net,trainFeats,trainSigs);
save('trainedNet.mat','net');

y = net(testFeats);
