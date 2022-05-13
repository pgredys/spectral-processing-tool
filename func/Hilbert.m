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