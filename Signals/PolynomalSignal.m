t = 0:0.01:5;
x = (t.^4 - 4*t.^3 - 2*t.^2 - 4*t + 3) + 4*sin(2*pi*7*t) + 4*rand(size(x));
bp = 0;
plot(t,x)
