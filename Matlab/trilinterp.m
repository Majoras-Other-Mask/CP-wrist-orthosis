%TRILINEAR INTERPOLATION
function [rho,theta]=trilinterp(p,r1,t1)
p=p./10;
for i=1:size(p,1)
    %set upper and lower map points
    up=ceil(p(i,:));
    low=floor(p(i,:));
    %determine distance from current point to lower map point
    d=p(i,:)-low;
    %interpolation stage 1
    rho00=(r1(low(1),low(2),low(3))*(1-d(1)))+(r1(up(1),low(2),low(3))*d(1));
    theta00=(t1(low(1),low(2),low(3))*(1-d(1)))+(t1(up(1),low(2),low(3))*d(1));
    rho10=(r1(low(1),up(2),low(3))*(1-d(1)))+(r1(up(1),up(2),low(3))*d(1));
    theta10=(t1(low(1),up(2),low(3))*(1-d(1)))+(t1(up(1),up(2),low(3))*d(1));
    rho01=(r1(low(1),low(2),up(3))*(1-d(1)))+(r1(up(1),low(2),up(3))*d(1));
    theta01=(t1(low(1),low(2),up(3))*(1-d(1)))+(t1(up(1),low(2),up(3))*d(1));
    rho11=(r1(low(1),up(2),up(3))*(1-d(1)))+(r1(up(1),up(2),up(3))*d(1));
    theta11=(t1(low(1),up(2),up(3))*(1-d(1)))+(t1(up(1),up(2),up(3))*d(1));
    %interpolation stage 2
    rho0=(rho00*(1-d(2)))+(rho10*d(2));
    theta0=(theta00*(1-d(2)))+(theta10*d(2));
    rho1=(rho01*(1-d(2)))+(rho11*d(2));
    theta1=(theta01*(1-d(2)))+(theta11*d(2));
    %interpolation stage 3
    rho(i)=(rho0*(1-d(3)))+(rho1*d(3));
    theta(i)=(theta0*(1-d(3)))+(theta1*d(3));
end
end
