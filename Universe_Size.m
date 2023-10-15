clear all; close all; clc;
%Expansion
figure(1)
tRange=[1,13.1]
Y0=[1;1]
[tSol,YSol]=ode45(@expandingUniverse,tRange,Y0)
plot(tSol,YSol(:,1))


%Contraction 
figure(2)
tRange=[1,13.1]
Y0=[1;1]
[tSol,YSol]=ode45(@contractingUniverse,tRange,Y0)
plot(tSol,YSol(:,1))


function dYdt= expandingUniverse(t,Y)
OmegaM=0.3      %Density of Matter
OmegaDE=0.7     %Density of dark Energy
R=Y(1)
v=Y(2)
dRdt = v
dvdt = -0.5*OmegaM./R^2+OmegaDE.*R 
dYdt=[dRdt;dvdt]
end


function dYdt= contractingUniverse(t,Y)
OmegaM=1.5
OmegaDE=0
R=Y(1)          %Size of the universe
v=Y(2)          %Rate of expansion
dRdt = v
dvdt = -0.5*OmegaM./R^2+OmegaDE.*R 
dYdt=[dRdt;dvdt]
end
