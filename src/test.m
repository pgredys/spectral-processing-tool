%% porównanie własnej imoplementacji FFT z wbudowanym
clc;close all;clear variables;
addpath 'D:\OneDrive\Studia\Semestr 8\1 - Identyfikacja układów mechatronicznych\3 - Projektowe\spectral-processing-tool\func'
%%
tmax = 3;
fs = 200;

t = 0:1/fs:tmax-1/fs;
y = sin(2*pi*5*t) + 2*sin(2*pi*10*t) + 4*sin(2*pi*7*t)+2*rand(size(t));

yf= fft(y);
s = length(yf);
f = linspace(0,fs-fs/s,s);
fig = figure(1);
plot(f,(abs(yf)/s*2))
xlim([0 fs/2])
xlabel('Freq (Hz)')
ylabel('Amplitude (~)')
hold on;
%% 
figure
Yh = hilbert(y);
YH = Hilbert(y);

plot(t,abs(Yh),'r')
hold on
plot(t,abs(YH),'b--')
%% analytic signal
z = y +1i*YH;
%%
z = hilbert(y);
instfrq = fs/(2*pi)*diff(unwrap(angle(z)));
plot(t(2:end),instfrq)
ylim([0 fs/2])
hold on
plot(t,y)
%% figure

[yupper,  ylower]=Envelope(y)
plot_param = {'Color', [205/255 155/255 155/255],'Linewidth',3}; 
plot(t,y)

hold on
plot(t,yupper,t,ylower,plot_param{:})

title('Hilbert Envelope')
hold off
[inst_amplitude,inst_phase,inst_freq] = Instinfo(y,fs);
%%
Fs=2500;
T=10;
t=0:1/Fs:T;
N=length(t);
f=[0:N-1]/N*Fs;
AM=(1-sawtooth(2*pi*6*t)).^7;
x=AM.*randn(size(AM));
plot_param = {'Color', [0 0 0],'Linewidth',2}; 
plot(t,x,plot_param{:})
%% periodogram
figure;
Y_per=Periodogram(y,fs);
plot(f,Y_per)
xlim([0 fs/2])
%% detrend
XX=3*t.^5+-25*t.^3+2*t.^2+1+20*rand(size(t));
plot(t,XX)
[p]=Detrend(t,XX,6);
hold on
plot(t,p)