function [psdx] = Periodogram(inputArg,Fs)

N = length(inputArg);
y = fft(inputArg);
psdx=Fs/N*abs(y).^2;

end