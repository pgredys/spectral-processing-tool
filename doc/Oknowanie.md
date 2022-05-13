# Okienkowanie sygnału

W praktycznych aplikacjach próbkowania sygnałów możliwe jest uzyskanie tylko skończonego zapisu sygnału. Dla systemu dyskretno czasowego zapis próbkowania skończonego daje w wyniku ścięty przebieg falowy, który ma inną charakterystykę spektralną niż pierwotny sygnał ciągły. Te nieciągłości powodują wyciek widma  informacji spektralnej, dając w wyniku widm dyskretne czasowe, które jest rozmytą względem oryginalnego ciągłego widma sygnału. Sposobem poprawy charakterystyki spektralnej próbkowanego sygnału jest zastosowanie okien.

---

## Okno Hanna

Okno ma kształ podobny do połowy cyklu fali kosinusoidalnej. Jest użuteczne do analizy przebiegów nie ustalonych dłuższych niż czas trwania okna, a także do aplikacji ogólnego zastoosowania.![](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Window_function_and_frequency_response_-_Hann.svg/1920px-Window_function_and_frequency_response_-_Hann.svg.png)

Implementacja w Matlabie:

```matlab
function Hann = Hann(Length)

if ~isequal(fix(Length), Length) 
    error('Length must be integer.')
end

Hann = 0.5 - 0.5*cos(2*pi * (1 : Length)' / (Length-1));

end
```

---

## Okno Hamminga

Okno Hamminga jest podobne do okna Hanna. Jego kształ równierz jest podobny do połowy fali kosinusoidalnej. Okno Hamminga w dziedziinie czasu nie się ga tak blisko zera krzy krawędziach jak okno Hanna.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Window_function_and_frequency_response_-_Gaussian_%28sigma_%3D_0.4%29.svg/1920px-Window_function_and_frequency_response_-_Gaussian_%28sigma_%3D_0.4%29.svg.png)

Implementacja w Matlabie:

```matlab
function Hamming = Hamming(Length)

if ~isequal(fix(Length), Length) 
    error('Length must be integer.')
end

alpha   = 0.54;
beta    = 1 - alpha;
Hamming = alpha - beta * cos(2*pi * (1 : Length)' / (Length-1)); 

end
```
