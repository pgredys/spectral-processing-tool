# Detrendowanie

Funkcja detrendująca odejmuje od serii danych linię najlepszego dopasowania (w sensie najmniejszych kwadratów) określąną danym stopniem wielomianu $n$ . Usunięcie trendu z zestawu danych może zamiast tego pozwolić skupić się na fluktuacjach i zidentyfikować dowolną liczbę ważnych czynników.

---

Procedura:

1. obliczenie współczynników wielomianu najlepiej dopasowanego do seri danych (w sensie najmniejszych kwadratów)

$$
\begin{pmatrix}
x_1^n & x_1^{n-1} & \dots & 1\\
x_2^n & x_2^{n-1} & \dots & 1\\
\vdots & \vdots & \ddots & \vdots \\
x_m^n &x_m^{n-1} & \dots & 1\\
\end{pmatrix}

\begin{pmatrix}
p_1\\
p_2\\
\vdots \\
p_{n+1}\\
\end{pmatrix}
=
\begin{pmatrix}
y_1\\
y_2\\
\vdots \\
y_m\\
\end{pmatrix}
$$

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
