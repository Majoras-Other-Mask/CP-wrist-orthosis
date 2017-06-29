load Test_33.mat

for idx = 1:data.numElements
    timeseriesObj = data.get(idx).Values;
    assignin('base',['ts' num2str(idx)], timeseriesObj);
end