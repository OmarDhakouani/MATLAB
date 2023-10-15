close all; clear all; clc
syms L1 L2 theta1 theta2
syms x y
x(L1,L2,theta1,theta2)=L2*cos(theta1+theta2)+L1*cos(theta1)
y(L1,L2,theta1,theta2)=L2*sin(theta1+theta2)+L1*sin(theta1)
syms fx fy
fx(theta1,theta2)=x(4,2,theta1,theta2)
fy(theta1,theta2)=y(4,2,theta1,theta2)
figure(1)
fplot(fx(theta1,0),fy(theta1,0))
axis equal
hold on 
fplot(fx(0,theta2),fy(0,theta2))
hold off
figure(2)
fsurf(fx,fy,0)
view(2)
axis equal
xpos=fx(pi/8,pi/6)
ypos=fy(pi/8,pi/6)
xposn=double(xpos)
yposn=double(ypos)
assume([theta1 theta2]>=0)
assumeAlso([theta1 theta2]<=pi)
[theta1sol,theta2sol]=solve([fx==3 fy==5],[theta1 theta2])
double(theta1sol)
double(theta2sol)
figure(3)
fsurf(fx,fy,0,[0 pi])
view(2)
axis equal
