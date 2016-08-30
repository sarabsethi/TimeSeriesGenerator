clear all;

timeSeriesData = {};
labels = {};
keywords = {};

for i = 1:1000
    [sig,f,phase,A,noiseA] = genSignal;
            
    timeSeriesData{end+1} = sig;
    labels{end+1} = sprintf('sineWaves_f,%f_phase,%f_A,%f_noiseA,%f',...
        f,phase,A,noiseA);
    keywords{end+1} = sprintf('f,%f_phase,%f_A,%f_noiseA,%f',f,phase,A,noiseA);
end

save('INP_ts.mat','timeSeriesData','labels','keywords');
