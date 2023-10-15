close all; clear all; clc;
%Aufgabe 9.1
%p=@(x) x.^5/120 - x.^3/6 + x
p=@(x)x.^5/120 - x.^3/6 + x
p_x=[0.0083 0 1.667 0 1 0]
dpdx = polyder(p_x)
dpxdx= @(x) x.^4*0.0415 + x.^2*5.001 + 1
x=[-2*pi:pi/8:2*pi];
figure (1)
plot(x,p(x),'LineWidth',2)
hold on 
plot(x,dpxdx(x),'LineWidth',2)
legend ('p(x)','dp/dx')
xlabel('x')
ylabel('p(x),d/dxp(x)')
grid on
%Aufgabe 9.2
a=[1]
b=[1 0 1]
[q,d]=polyder(a,b)
f=@(x) 1./(x.^2+1)
dfxdx=@(x) (-2.*x)./(x.^4+x.^2*2+1)
x=linspace (-10,10,10000);
figure (2)
plot(x,f(x),'LineWidth',2)
hold on 
plot(x,dfxdx(x),'LineWidth',2)
legend ('f(x)','df/dx')
xlabel('x')
ylabel('f(x),d/dx f(x)')
grid on
%Aufgabe 9.3
x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
y = [0.5000, 0.2000, 0.1000, 0.0588, 0.0385, 0.0270, 0.0200, 0.0154, 0.0122, 0.0099];
dy = diff(y)./diff(x) ;
xd = x(1:end-1);
p = polyfit(x,y,4)
figure(3)
plot(xd,dy,'LineWidth',2)
hold on
plot(x,y,'LineWidth',2)
plot(p)
legend ('y(x)',"y'(x)")
xlabel('x')
ylabel('y(x),dy/dx , 4.Approximation')
hold off
figure(4)
Ab=polyder(p)
plot(p,'LineWidth',2)
hold on 
plot(Ab,'LineWidth',2)
hold off
figure (5)
Ab=polyder(p)
plot(p,'LineWidth',2)
hold on 
plot(xd,dy,'LineWidth',2)
plot(Ab,'LineWidth',2)
plot(x,y,'LineWidth',2)
plot(xd,dy,'LineWidth',2)
hold off