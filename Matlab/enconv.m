%Encoder Pulse Count to Position Count Converter
%Version 1.0
%Devon Holley
%Last Edited 8/22/13


n=input('Enter Data Structure Name: ');
x=input('Enter Encoder to be Analyzed: ');

count=size(n.OutputLog);
output=0;

if x==1;
    for i=1:count(1);
        if n.OutputLog(i,6) > n.OutputLog(i,11);
            output(i+1)=output(i)+1;
        elseif n.OutputLog(i,6) < n.OutputLog(i,11); 
            output(i+1)=output(i)-1;
        else
            output(i+1)=output(i);
        end
    end
elseif x==2;
    for i=1:count(1);
        if n.OutputLog(i,8) > n.OutputLog(i,10);
            output=output+1;
        else
            output=output-1;
        end
    end
end

    