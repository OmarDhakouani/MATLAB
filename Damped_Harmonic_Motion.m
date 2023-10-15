clear all; close all; clc;

tRange=[0 1]
Y0=[0.1;0]
[tSol,YSol]=ode45(@harmonicMotion,tRange,Y0)
%Extract the position
y=YSol(:,1)
figure(1)
plot(tSol,y)
% Label axes
xlabel("Time")
ylabel("Position")
%Extract the velocity
v=YSol(:,2)
figure(2)
plot(tSol,v)
% Label axes
xlabel("Time")
ylabel("Velocity")


function dYdt = harmonicMotion(t,Y)
%Define constants k, m, and b
k = 50;
m = 0.05;
b = 0.5;
%Extract the position x from the first element of Y.
y = Y(1);
%Extract the velocity v from the second element of Y.
v = Y(2);
%Complete expression for dxdt
dxdt = v;
%Complete expression for dvdt
dvdt = -(k/m)*y - (b/m)*v;
%Create dYdt, column vector containing dxdt, and dvdt
dYdt = [dxdt;dvdt];

end