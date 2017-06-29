% Post-Processing Data Trigger
% Devon Holley
% Created 10/27/14

% Home Dimensions (x=290-340 y=225-275)
x1=290;
x2=340;
y1=200;
y2=275;

data=input('Enter Vector Name: ');
n=1;

clear trigger
for i=2:length(data)
    if data(i,1) < x2 && data(i-1,1) >= x2
        if data(i,2) < y2 && data(i,2) > y1 
            trigger(n)=i;
            n=n+1;
        end
    elseif data(i,1) > x2 && data(i-1,1) <= x2
        if data(i,2) < y2 && data(i,2) > y1
            trigger(n)=i;
            n=n+1;
        end
    elseif data(i,1) > x1 && data(i-1,1) <= x1
        if data(i,2) < y2 && data(i,2) > y1
            trigger(n)=i;
            n=n+1;
        end
    elseif data(i,1) < x1 && data(i-1,1) >= x1
        if data(i,2) < y2 && data(i,2) > y1
            trigger(n)=i;
            n=n+1;
        end
    elseif data(i,2) < y1 && data(i-1,2) >= y1
        if data(i,1) < x2 && data(i,1) > x1
            trigger(n)=i;
            n=n+1;
        end
    elseif data(i,2) > y1 && data(i-1,2) <= y1
        if data(i,1) < x2 && data(i,1) > x1
            trigger(n)=i;
            n=n+1;
        end
    elseif data(i,2) < y2 && data(i-1,2) >= y2
        if data(i,1) < x2 && data(i,1) > x1
            trigger(n)=i;
            n=n+1;
        end
    elseif data(i,2) > y2 && data(i-1,2) <= y2
        if data(i,1) < x2 && data(i,1) > x1
            trigger(n)=i;
            n=n+1;
        end
    end
end

disp(trigger')

            
        