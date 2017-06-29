%% Derivative
%% By Devon Holley
%% 9/12/14

function [output] = deriv(input)

n=1;
output=zeros(1,length(input));

for j=1:1
for i = 2:(length(input))
    output(j,i) = (input(i,j)-input(i-1,j))/.001;
    n=n+1;
end
end

    