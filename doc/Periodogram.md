# Periodogram

Periodogram jest nieparametrycznym oszacowaniem gęstości widmowej mocy (PSD) szeroko rozumianego stacjonarnego sygnału zawiarającego elementy stochastyczne. Periodogram jest transformatą Fouriera obciążonej oceny sekwencji autokorelacji. Dla sygnału_xn_ próbkowanego z częstotliwością _fs_ próbek na jednostkę czasu, periodogram jest zdefiniowany jako:

![alt text](https://latex2png.com/pngs/d073fc7a0721af1be0e1639df0c13107.png)

```matlab
function [psdx] = Periodogram(inputArg,Fs)

N = length(inputArg);
y = fft(inputArg);
psdx=Fs/N*abs(y).^2;

end
```

---

Źródło:

> *Periodogram power spectral density estimate - MATLAB periodogram*. (n.d.). Retrieved April 7, 2022, from https://www.mathworks.com/help/signal/ref/periodogram.html


