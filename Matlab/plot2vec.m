%Extracting Data From A Plot
%Devon Holley
%12/3/14
%Discovered at http://www.mathworks.com/matlabcentral/answers/100921-how-do-i-extract-data-points-from-a-plot

%select plot to extract from prior to running script

h = findobj(gca,'Type','line');

x=get(h,'Xdata');

y=get(h,'Ydata');

xvar=cell2mat(x);
yvar=cell2mat(y);