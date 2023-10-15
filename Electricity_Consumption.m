clear all; close all; clc;
load electricityData
elecFun = @(x) -0.000537*x.^3 + 0.00926*x.^2 + 0.1526.*x + 7.418 - 10; 
plot(time, usage -10)
hold on
fplot(elecFun,[0 20],"--")
grid on 
x0=[14 16]
x=fzero(elecFun,x0)
plot(x,elecFun(x),"o")
hold off