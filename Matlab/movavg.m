%Moving Average Filter
function y = movavg(x)

n=1;
for n=1:74
    y(n)=max(x(n*265:n*265 + 265))
    n=n+1;
end
end