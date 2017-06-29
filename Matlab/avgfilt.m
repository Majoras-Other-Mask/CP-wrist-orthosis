function [ senseout ] = avgfilt( sensein )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for n=1:14981
    senseout(n)=(sensein(n)+sensein(n+1)+sensein(n+2)+sensein(n+3)+sensein(n+4)+sensein(n+5)+sensein(n+6)+sensein(n+7)+sensein(n+8)+sensein(n+9)+sensein(n+10)+sensein(n+11)+sensein(n+12)+sensein(n+13)+sensein(n+14)+sensein(n+15)+sensein(n+16)+sensein(n+17)+sensein(n+18)+sensein(n+19))/20;
end

end

