# Sygnał analityczny

sygnał analityczny koresponduję z sygnałem rzeczywistym, nie posiadając jednocześnie  ujemnych częstotliwości. Sygnał taki składa się z sumy sygnału rzeczywistego z jego transformatą Hilberta przemnożoną przez jednąstkę urojoną _i_

![alt text](https://latex2png.com/pngs/f6d62a88ade10456a896f8aae29c031f.png)

---

Z transformacji Hilberta można wyprowadzić następujące wielkości:

* Amplituda chwilowa - będąca obwiedną sygnału rzeczywistego

* Faza  chwilowa - pulsacja sygnału rzeczywistego

* Częstotliwość chwilowa - szybkość zmian fazy tego sygnału

---

Implemetacja w Matlabie:

```matlab
function [inst_amplitude,inst_phase,inst_freq] = Instinfo(x,fs)

z = hilbert(x);
inst_amplitude = abs(z);
inst_phase = unwrap(angle(z));
inst_freq = diff(inst_phase)/(2*pi)*fs;

end
```

---

Źródła:

> Lawrence Marple, S. (1999). Computing the discrete-time analytic signal via fft. *IEEE Transactions on Signal Processing*, *47*(9), 2600–2603. https://doi.org/10.1109/78.782222

> Analytic Signals and Hilbert Transform Filters | Mathematics of the DFT (n.d.). Retrieved March 18, 2022, from https://www.dsprelated.com/freebooks/mdft/Analytic_Signals_Hilbert_Transform.html
