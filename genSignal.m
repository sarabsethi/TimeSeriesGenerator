function [sig , f , phase, A , noiseA] = genSignal
%GENSIGNAL Summary of this function goes here
%   Detailed explanation goes here

f = randNumBetween(1/100,3/100);
phase = randNumBetween(0,1/f);
%phase = 0;
A = randNumBetween(2,8);
noiseA = randNumBetween(0,0.8);

t = 1:150;
y = A * sin(2*pi*f*t + phase);

sig = y + noiseA * randn(1, length(y));

end

