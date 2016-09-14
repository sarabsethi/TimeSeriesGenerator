clear all;

sigLength = 150;
coeffs = 0:0.001:0.999;
sigsPerCoeff = 5;

timeSeriesData = {};
labels = {};
keywords = {};

for i = 1:length(coeffs)
    % Create AR(1) model
    variance = 0.01;
    ar1Coeff = coeffs(i);
    model = arima('Constant',1,'AR',ar1Coeff,'Variance',variance);

    Y_long = simulate(model , sigLength*2 , 'NumPaths' , sigsPerCoeff);

    for j = 1:sigsPerCoeff
        % Generate signal (burn in first half to avoid transients)
        Y = Y_long(sigLength+1 : sigLength*2 , j);

        timeSeriesData{end+1} = Y;
        labels{end+1} = sprintf('AR1Model_var=%f_coeff=%f_num=%i',variance,ar1Coeff,j);
        keywords{end+1} = sprintf('var=%f,coeff=%f,num=%i',variance,ar1Coeff,j);
    end
end

save('INP_ts.mat','timeSeriesData','labels','keywords');

TS_init('INP_ts.mat');