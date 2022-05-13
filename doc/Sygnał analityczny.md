# Sygna³ analityczny

sygna³ analityczny korespondujê z sygna³em rzeczywistym, nie posiadaj¹c jednoczeœnie  ujemnych czêstotliwoœci. Sygna³ taki sk³ada siê z symy sygna³u rzeczywistego z jego transformat¹ Hilberta przemno¿on¹ przez jedn¹stkê urojon¹ $i$

$$
z(t) = f(t) +iH\{f(t)\}
$$

---

Z transformacji Hilberta mo¿na wyprowadziæ nastêpuj¹ce wielkoœci:

* Amplituda chwilowa - bêd¹ca obwiedn¹ sygna³u rzeczywistego

* Faza  chwilowa - pulsacja sygna³u rzeczywistego

* Czêstotliwoœæ chwilowa - szybkoœæ zmian fazy tego sygna³u

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

ród³a:

> Lawrence Marple, S. (1999). Computing the discrete-time analytic signal via fft. *IEEE Transactions on Signal Processing*, *47*(9), 2600–2603. https://doi.org/10.1109/78.782222

> Analytic Signals and Hilbert Transform Filters | Mathematics of the DFT (n.d.). Retrieved March 18, 2022, from https://www.dsprelated.com/freebooks/mdft/Analytic_Signals_Hilbert_Transform.html
