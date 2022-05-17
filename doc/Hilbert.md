# Dyskretna Transformata Hilberta

procedura obliczania:

1. Dyskretna transformata Fouriera N-elementowego sygnału x[m]

2. utworzenie N-elementowej jednostronnej transformacji analityczne go wygnału Z[m]

![alt text](https://latex2png.com/pngs/cfdd1974a1a87bd403f3d11608fefc50.png)

3. Odwrotna transformata Fouriera Z[m]

***

Implemetacja w Matlabie:

```matlab
function [outputArg] = Hilbert(inputArg)

X = fft(inputArg);
N=length(X);
Z =zeros(1,N);

for m=1:N
    if(m-1==0)
        Z(m)=X(1);
    elseif (m>1&&m<N/2)
        Z(m) =2*X(m);
    elseif (m==N/2+1)
        Z(m) = X(N/2);
    elseif (N/2+2<=m && m<= N)
        Z(m) = 0;
    end
end

outputArg = ifft(Z);

end
```

---

Procedura za : 

> Lawrence Marple, S. (1999). Computing the discrete-time analytic signal via fft. *IEEE Transactions on Signal Processing*,*47*(9), 2600–2603. https://doi.org/10.1109/78.782222
