function [normFeatVec, normInfo] = normaliseFeatVec(featVec, normInfo)
%NORMALISEFEATVEC Summary of this function goes here
%   Detailed explanation goes here

if nargin < 2
    for i = 1:size(featVec,1)
       normInfo(i).max = max(featVec(i,:));
       normInfo(i).min = min(featVec(i,:));
    end
end

normFeatVec = zeros(size(featVec));

for i = 1:size(normFeatVec,1)
    row = featVec(i,:);    
    if iqr(row) == 0
        normFeatVec(i,:) = 0.5;
        continue;
    end
    row = (row - normInfo(i).min) / (normInfo(i).max - normInfo(i).min);
    normFeatVec(i,:) = row;
end

end

