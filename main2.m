clear all;
close all;

N = 256;
sigma_b = 0.92;
a = 0.7;

noise = genWhiteNoise(0.5, N);
AR1 = filter([1, 1-a],1, noise);

bccAr1 = BiasedCrossCorr(AR1, N-1);

[a, v] = YuleWalkerSolver(bccAr1, 1);


[voise,fs1] = audioread("data/voise_oo.flac");
[nonvoise,fs2] = audioread("data/193305__margo-heston__ch.flac");



[pitch, sigma2, Aopt] = BlockAnalysis(voise(1:N),25, fs1);
Y = BlockSynthesis(pitch,sigma2,Aopt,N);


t1=linspace(0,length(voise(1:N))/fs1,length(voise(1:N)));
t2=linspace(0,length(Y)/fs2,length(Y));

figure(4)
subplot(2, 1, 1); 
plot(t1, voise(1:N)); 
title('Voise');

subplot(2, 1, 2);
plot(t2,Y)
title('Y'); 
