# Sygna� analityczny

sygna� analityczny koresponduj� z sygna�em rzeczywistym, nie posiadaj�c jednocze�nie  ujemnych cz�stotliwo�ci. Sygna� taki sk�ada si� z symy sygna�u rzeczywistego z jego transformat� Hilberta przemno�on� przez jedn�stk� urojon� $i$

$$
z(t) = f(t) +iH\{f(t)\}
$$

---

Z transformacji Hilberta mo�na wyprowadzi� nast�puj�ce wielko�ci:

* Amplituda chwilowa - b�d�ca obwiedn� sygna�u rzeczywistego

* Faza  chwilowa - pulsacja sygna�u rzeczywistego

* Cz�stotliwo�� chwilowa - szybko�� zmian fazy tego sygna�u

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

�r�d�a:

> Lawrence Marple, S. (1999). Computing the discrete-time analytic signal via fft. *IEEE Transactions on Signal Processing*, *47*(9), 2600�2603. https://doi.org/10.1109/78.782222

> Analytic Signals and Hilbert Transform Filters | Mathematics of the DFT (n.d.). Retrieved March 18, 2022, from https://www.dsprelated.com/freebooks/mdft/Analytic_Signals_Hilbert_Transform.html
