j = 1; %counter for SDI
k = 0; 
diff = 0; 
for i = 1:10001
    if round(all(i),3) == round(SDI(j),3)
        j = j+1; 
    else
        while round(SDI(j),3) == round(SDI(j-1),3)
            j = j+1; 
        end

        if k == 0
            diff = all(i);
            k = k+1; 
        else
            diff = [diff all(i)]; 
        end
    end
end 
