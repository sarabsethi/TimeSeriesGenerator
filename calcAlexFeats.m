function feats = calcAlexFeats( sigs )

feats = zeros(10,size(sigs,2));

for i = 1:size(sigs,2)
    tempFName = ['./temp_data/temp',num2str(i),'.txt'];
    dlmwrite(tempFName,sigs(:,i));
    [status,cmdout] = system(['run_features ',tempFName]);
    lines = strsplit(cmdout,'\n');
    numsCell = strsplit(cell2mat(lines(2)),',');
    feats(:,i) = str2double(numsCell);
end

delete('./temp_data/*.txt')

end

