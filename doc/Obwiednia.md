# Obwiednia

Obwiednia rozumiana jako ograniczenie danej rodziny krzywych. Bywa szczególnie często używane w odniesieniu do opisu interferencji dwóch sygnałów o nieznacznie różniących się częstotliwościach.
Liczona z wykorzystaniem transformaty Hilberta jest równa amplitudzie chwilowej czyli wartości bezwzględnej amplitudy transformacji. Obwiednie dolną wyznacza się przez przemnożenie górnej przez _-1_

![alt text](https://latex2png.com/pngs/20bd0566df0527bfa78f6bc6857e8264.png)

---

Implemetacja w Matlabie:

```matlab
function [yupper,  ylower] = Envelope(inputArg)

z= Hilbert(inputArg);
env = abs(z);
yupper=env;
ylower=-env;

end
```

---

Źródło:

> Yang, Y. (2017). A Signal Theoretic Approach for Envelope Analysis of Real-Valued Signals. *IEEE Access*, *5*, 5623–5630. https://doi.org/10.1109/ACCESS.2017.2688467
