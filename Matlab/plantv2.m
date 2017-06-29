function [qdd] = plantv2(torque,q)

s1=sind(q(1));
c1=cosd(q(1));
s2=sind(q(2));
c2=cosd(q(2));
s4=sind(q(4));
c4=cosd(q(4));
s5=sind(q(5));
c5=cosd(q(5));
s6=sind(q(6));
c6=cosd(q(6));
s7=sind(q(7));
c7=cosd(q(7));

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
a5=.12051;
d4=.04586;
d3=q(3);
a2=.37546;
d1=.33655;

%Forward Kinematics for Positioning
x=-a5*c1*s2*c5 - a5*s5*(s1*c4 - c1*c2*s4) - d4*c1*s2 + d3*c1*c2 + a2*c1*c2;
y=-a5*s1*s2*c5 + a5*s5*(c1*c4 + s1*c2*c4) - d4*s1*s2 + d3*s1*c2 + a2*s1*c2;
z=-a5*c2*c5 - a5*s2*s4*s5 - d4*c2 - d3*s2 - a2*s2 + d1;

%Jacobian
Jv1=[-a6cm*s6,0;a6cm*c6,0;0,0];
Jv2=[-a7cm*c6*c7 + d7cm*s6 - a6*s6,a7cm*s6*s7;-a7cm*s6*c7 - d7cm*c6 + a6*c6,-a7cm*c6*s7;0,-a7cm*c7];

Jw1=[0,0;0,0;1,0];
Jw2=[0,-c6;0,-s6;1,0];

%Rotation Matrix
R6=[-s6,0,-c6;c6,0,-s6;0,-1,0];

D6=m6*(Jv1'*Jv1)+Jw1'*I6*Jw1;
D7=m7*(Jv2'*Jv2)+Jw2'*R6*I7*R6'*Jw2;
D=D6+D7;%Mass Matrix

%Centrifugal
c112=-m7*a7cm^2*s7*c7;
C22=[0 0;c112 0];

%Coriolis
c121=-m7*a7cm^2*s7*c7;
c122=m7*a7cm*c7*(d7cm - a6);
C1C2=[c121;c122];

%Gravitational
G=-((Jv1'*m6*[9.81;0;0]) + (Jv2'*m7*[0;0;-9.81]));

qdd=(torque-(C22+C1C2)-G)*inv(D);

