x=zeros(39555,1);

for i=1:39555;
    if tg.OutputLog(i,15) >= 0
        x(i)=tg.OutputLog(i,15)+1;
    else
        x(i)=tg.OutputLog(i,15)-1;
    end
end
