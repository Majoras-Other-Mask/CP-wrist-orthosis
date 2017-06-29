function [D] = plant(q1,q2,d3,q4,q5,q6,q7)

s1=sind(q1);
c1=cosd(q1);
s2=sind(q2);
c2=cosd(q2);
s4=sind(q4);
c4=cosd(q4);
s5=sind(q5);
c5=cosd(q5);
s6=sind(q6);
c6=cosd(q6);
s7=sind(q7);
c7=cosd(q7);

m6=.4242; %kg
m7=.2256; %kg

I6=[2.259e-3 -7.049e-5 -9.252e-5;-7.049e-5 2.091e-3 -4.603e-4;-9.252e-5 -4.603e-4 8.911e-4];
I7=[7.022e-4 8.207e-5 -2.535e-5;8.207e-5 1.675e-4 -1.046e-4;-2.535e-5 -1.046e-4 6.273e-4];

%in m
a6cm=.01425;
d6cm=.01386;
a7cm=-.00458;
d7cm=-.00285;
a6=.03952;

Jv1=[a6cm*s6*(c1*s2*c5+s5*(s1*c4-c1*c2*s4))+a6cm*c6*(s1*s4+c1*c2*c4),0;
    a6cm*s6*(s1*s2*c5-s5*(c1*c4+s1*c2*s4))-a6cm*c6*(c1*s4-s1*c2*c4),0;
    a6cm*s6*(c2*c5+s2*s4*s5)-a6cm*s2*c4*c6,0];
Jv2=[a7cm*c7*c6*(c1*s2*c5+s5*(s1*c4-c1*c2*s4))-a7cm*c7*s6*(s1*s4+c1*c2*c4)-d7cm*s6*(c1*s2*c5+s5*(c1*c4+c1*c2*s4))-d7cm*c6*(s1*s4+c1*c2*c4)+a6*s6*(c1*s2*c5+s5*(s1*c4-c1*c2*s4))+a6*c6*(s1*s4+c1*c2*c4),...
    -a7cm*s7*(s6*(c1*s2*c5+s5*(s1*c4-c1*c2*s4))+c6*(s1*s4+c1*c2*c4))+a7cm*c7*(c1*s2*c5-c5*(s1*c4-c1*c2*s4));
    a7cm*c7*c6*(s1*s2*c5-s5*(c1*c4+s1*c2*s4))+a7cm*c7*s6*(c1*s4-s1*c2*c4)-d7cm*s6*(s1*s2*c5-s5*(c1*c4+s1*c2*s4))+d7cm*c6*(c1*s4-s1*c2*c4)+a6*s6*(s1*s2*c5-s5*(c1*c4+s1*c2*s4))-a6*c6*(c1*s4-s1*c2*c4),...
    -a7cm*s7*(s6*(s1*s2*c5-s5*(c1*c4+s1*c2*s4))-c6*(c1*s4-s1*c2*c4))+a7cm*c7*(s1*s2*s5+c5*(c1*c4+s1*c2*s4));
    a7cm*c7*c6*(c2*c5+s2*s4*s5)+a7cm*c7*s6*s2*c4-d7cm*s6*(c2*c5+s2*s4*s5)+d7cm*c6*s2*c4+a6*s6*(c2*c5+s2*s4*s5)-a6*c6*s2*c4,...
    -a7cm*s7*(s6*(c2*c5+s2*s4*s5)-s2*c4*c6)+a7cm*c7*(c2*s5-s2*s4*c5)];

Jw1=[-c1*s2*c5+c5*(s1*c4-c1*c2*s4),0;-s1*s2*s5-c5*(c1*c4+s1*c2*s4),0;-c2*s5+s2*s4*c5,0];
Jw2=[-c1*s2*c5+c5*(s1*c4-c1*c2*s4),c6*(c1*s2*c5+s5*(s1*c4-c1*c2*s4))-s6*(s1*s4+c1*c2*c4);
    -s1*s2*s5-c5*(c1*c4+s1*c2*s4),c6*(s1*s2*c5-s5*(c1*c4+s1*c2*s4))+s6*(c1*s4-s1*c2*c4);
    -c2*s5+s2*s4*c5,c6*(c2*c5+s2*s4*s5)+s2*c4*s6];

R16=[-c1*s2*c5-s5*(s1*c4-c1*c2*s4),s1*s4+c1*c2*c4,-c1*s2*c5+c5*(s1*c4-c1*c2*s4);
    -s1*s2*c5+s5*(c1*c4+s1*c2*s4),-c1*s4+s1*c2*c4,-s1*s2*s5-c5*(c1*c4+s1*c2*s4);
    -c2*c5-s2*s4*s5,-s2*c4,-c2*s5+s2*s4*c5];
R17=[s6*(c1*s2*c5+s5*(s1*c4-c1*c2*s4))+c6*(s1*s4+c1*c2*c4),c1*s2*c5-c5*(s1*c4-c1*c2*s4),c6*(c1*s2*c5+s5*(s1*c4-c1*c2*s4))-s6*(s1*s4+c1*c2*c4);
    s6*(s1*s2*c5-s5*(c1*c4+s1*c2*s4))-c6*(c1*s4-s1*c2*c4),s1*s2*s5+c5*(c1*c4+s1*c2*s4),c6*(s1*s2*c5-s5*(c1*c4+s1*c2*s4))+s6*(c1*s4-s1*c2*c4);
    s6*(c2*c5+s2*s4*s5)-s2*c4*c6,c2*s5-s2*s4*c5,c6*(c2*c5+s2*s4*s5)+s2*c4*s6];

D6=m6*Jv1'*Jv1+Jw1'*R16*I6*R16'*Jw1;
D7=m7*Jv2'*Jv2+Jw2'*R17*I7*R17'*Jw2;
D=D6+D7;

