# Detrendowanie

Funkcja detrendująca odejmuje od serii danych linię najlepszego dopasowania (w sensie najmniejszych kwadratów) określąną danym stopniem wielomianu _n_ . Usunięcie trendu z zestawu danych może zamiast tego pozwolić skupić się na fluktuacjach i zidentyfikować dowolną liczbę ważnych czynników.

---

Procedura:

1. obliczenie współczynników wielomianu najlepiej dopasowanego do seri danych (w sensie najmniejszych kwadratów)
2. Wyznaczenie krzywej z współczynników wielomianów
3. Zwrócenie różnucy między krzywą dopasowaną do sygnału a sygnałem wejściowym

---

```matlab
function [detrend,trend,coef] = Detrend(x,y,n)

V=zeros(length(x),n+1);
for row=1:length(x)
    for column=1:n+1
        V(row,column)=x(row)^(n+1-column);
    end
end

coef = (V\y')';
trend=zeros(1,length(x));

for i=1:length(x)
result = coef(1);
for j=2:length(coef)
     result = result*x(i) + coef(j);    % Horner
end
    trend(i)=result;
end

detrend=y-trend;

end
```
