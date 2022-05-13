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

