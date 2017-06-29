a=input('Enter array to evaluate: ');

m=1;
for n=2:length(a)
    f(m)=1/(a(n)-a(n-1));
    m=m+1;
end
