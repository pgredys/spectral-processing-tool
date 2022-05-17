S = load('noisyecg.mat');
noisyECG = S.noisyECG_withTrend;
t=0:1e-3:(length(noisyECG)-1)*1e-3;
x=noisyECG'
plot(t,x)
periodogram(x)