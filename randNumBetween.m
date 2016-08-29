function r = randNumBetween( bottom , top , vecLength)
%RANDNUMBETWEEN Summary of this function goes here
%   Detailed explanation goes here

if nargin < 3
    vecLength = 1;
end

r = (top-bottom) .* rand(vecLength,1) + bottom;

end

