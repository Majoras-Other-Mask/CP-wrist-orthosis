% Data Plot Generation - Raw Data and Mean/Standard Deviation
% Devon Holley
% Created 10/29/14

d=input('Enter Name of Normalized Data Matrix: ');
i=.001:.001:1;
n=size(d');

figure,subplot(2,1,1),plot(i,d)
subplot(2,1,2),plot(i,mean(d'),'k',i,mean(d')+(std(d')/sqrt(n(1))),'b.', ...
i,mean(d')-(std(d')/sqrt(n(1))),'b.',i,mean(d')+std(d'),'r--',i,mean(d')-std(d'),'r--')
