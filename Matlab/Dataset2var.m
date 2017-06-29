for idx = 1:data.numElements
    timeseriesObj = data.get(idx).Values;
    if idx == 1
        output = [timeseriesObj.Time timeseriesObj.Data]; 
    else
        output = [output timeseriesObj.Data]; 
    end
end