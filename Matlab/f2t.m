function [tau_m1,tau_m2] = f2t(top,bottom)
%#codegen

% F1=(top/1901)*(50/.02)*4.4482216;
% F2=(bottom/1901)*(50/.02)*4.4482216;


F1=(top/1901)*(50/.02)*4.4482216;
F2=(bottom/1901)*(50/.02)*4.4482216;

% Ffe = (F1 + F2)/2;
% Ffe = (F1/3) + ((2*F2)/3);
% Fps = (F1 - F2)/2;
% Fps = ((4*F1)/7) - ((3*F2)/7);

%Revision 8/12/14
% F1ps=(F1/2.7)-(F2/1.588);
% F1fe=(F1+F2)/1.588;
% F2ps=(-F1/2.7)+(F2/1.588);
% F2fe=(F1+F2)/2.7;

%Revision 9/30/14
F1ps=(F1-F2)/2;
F1fe=(F1+F2)/2;
F2ps=(F2-F1)/2;
F2fe=(F1+F2)/2;


% Ffe=((10*F1fe)+(17*F2fe))/27;
Ffe=(F1fe+F2fe)/2;
Fps=(F1ps-F2ps)/2;

% tau_m1=Fps/(.76535);
% tau_m2=Ffe/(.8159*2);

tau_m1=Fps*.0435;
tau_m2=Ffe*.065;


end
