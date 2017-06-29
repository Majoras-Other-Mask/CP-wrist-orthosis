function [x,y,z]=position(j1,j2,j4,j5,j6,d3)

d1=336.55;
a2=375.46;
d4=45.86;
a5=128.65;
d6=59.63;
a6=40.51;

x=(-a6*cosd(j6)*(cosd(j1)*sind(j2)*cosd(j5)+sind(j5)*(sind(j1)*cosd(j4)-cosd(j1)*cosd(j2)*sind(j4))))+(a6*sind(j6)*(sind(j1)*sind(j4)+cosd(j1)*cosd(j2)*cosd(j4)))-d6*(cosd(j1)*sind(j2)*cosd(j5)-cosd(j5)*(sind(j1)*cosd(j4)-cosd(j1)*cosd(j2)*sind(j4)))-(a5*cosd(j1)*sind(j2)*cosd(j5))-(a5*sind(j5)*(sind(j1)*cosd(j4)-cosd(j1)*cosd(j2)*sind(j4)))-(d4*cosd(j1)*sind(j2))+(d3*cosd(j1)*cosd(j2))+(a2*cosd(j1)*cosd(j2));
y=(-a6*cosd(j6)*(sind(j1)*sind(j2)*cosd(j5)-sind(j5)*(cosd(j1)*cosd(j4)+sind(j1)*cosd(j2)*sind(j4))))-(a6*sind(j6)*(cosd(j1)*sind(j4)-sind(j1)*cosd(j2)*cosd(j4)))-(d6*(sind(j1)*sind(j2)*sind(j5)+cosd(j5)*(cosd(j1)*cosd(j4)+sind(j1)*cosd(j2)*sind(j4))))-(a5*sind(j1)*sind(j2)*cosd(j5))+(a5*sind(j5)*(cosd(j1)*cosd(j4)+sind(j1)*cosd(j2)*cosd(j4)))-(d4*sind(j1)*sind(j2))+(d3*sind(j1)*cosd(j2))+(a2*sind(j1)*cosd(j2));
z=(-a6*cosd(j6)*(cosd(j2)*cosd(j5)+sind(j2)*sind(j4)*sind(j5)))-(a6*sind(j2)*cosd(j4)*sind(j6))-(d6*(cosd(j2)*sind(j5)-sind(j2)*sind(j4)*cosd(j5)))-(a5*cosd(j2)*cosd(j5))-(a5*sind(j2)*sind(j4)*sind(j5))-(d4*cosd(j2))-(d3*sind(j2))-(a2*sind(j2))+d1;

end