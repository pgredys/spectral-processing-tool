# Periodogram

Periodogram jest nieparametrycznym oszacowaniem gęstości widmowej mocy (PSD) szeroko rozumianego stacjonarnego sygnału zawiarającego elementy stochastyczne. Periodogram jest transformatą Fouriera obciążonej oceny sekwencji autokorelacji. Dla sygnału $xn$ próbkowanego z częstotliwością $fs$ próbek na jednostkę czasu, periodogram jest zdefiniowany jako:

$$
\hat F(f) = \frac{\Delta t}{N} \Bigg | {\sum_{n=0}^{N - 1} x_ne^{-j2\pi \Delta t n}\Bigg | } ^2
$$

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


