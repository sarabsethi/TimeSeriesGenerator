function [sig , f , A , noiseA] = genSignal
%GENSIGNAL Summary of this function goes here
%   Detailed explanation goes here

f = 1/100;
A = randNumBetween(2,8);
noiseA = randNumBetween(0,0.5);

t = 1:150;
y = sin(2*pi*f*t);

sig = y + noiseA * randn(1, length(y));

end

