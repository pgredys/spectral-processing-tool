%% test 2
clc;close all;clear all;
addpath 'D:\OneDrive\Studia\Semestr 8\1 - Identyfikacja układów mechatronicznych\3 - Projektowe\spectral-processing-tool\func'
%%
fs    = 10;
t     = 0 : 1/fs : 40; 
x     = sin(2*pi*3*t) + rand(1, length(t))*10; 
 figure;   
[Power, Frequency] = WelchPSD(x,[], Hann(length(t))* 0.25, .5, fs); 
plot(gca, Frequency, 10*log10(abs(Power)))
title(gca, 'Welch Cross Power Spectral Density Estimate') 
xlabel(gca, 'Frequency (Hz)')
ylabel(gca, 'Power / Frequency (db/Hz)')
grid(gca, 'on')