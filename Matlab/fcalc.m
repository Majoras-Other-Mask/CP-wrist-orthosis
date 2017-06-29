for i=1:7
    x(i) = mean(tg.OutputLog(10000*i-2000:10000*i,15)) - mean(tg.OutputLog(10000*i+3000:10000*i+5000,15));
    y(i) = mean(tg.OutputLog(10000*i-2000:10000*i,16)) - mean(tg.OutputLog(10000*i+3000:10000*i+5000,16));
end