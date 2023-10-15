close all; clear all; clc;
figure (1);
%%Aufgabe 1
x1=[0 1 2 1 0];
y1=[0 1 0 -1 0];
subplot (5,1,1)
plot(x1,y1)
%%Aufgabe 2
x2= -10:0.1:10;
y2= (-1 .* (x2.^2));
subplot (5,1,2)
plot(x2,exp(y2))
x3= linspace(-4*pi,4*pi,2000);
y3= sin (x3);
subplot (5,1,3)
plot(x3,y3)
%%Aufgabe 3 
x4= linspace(-100,100,100000);
subplot (5,1,4)
plot(x4,x4.^2)
hold on
plot(x4,x4.^3)
plot(x4,x4.^4)
plot(x4,exp(-1 .* (x4.^2)))
legend('x^2','x^3','x^4','exp(-x^2)')
ylim([-10 10]);
xlim([-10 10]);
grid on
hold off
%%Aufgabe 4
x5= linspace(-1,1,50000)
subplot(5,1,5)
fplot(@(x5) 1./x5,[-1 1])
%%Aufgabe 5
figure(2);
subplot(2,1,1)
x=linspace(-8,8,40);
y=linspace(-8,8,40);
[mX,mY]=meshgrid(x,y);
mR=-0.5 .* (mX.^2 + mY.^2);
mZ=(0.5/pi).* exp(mR);
surf(mX,mY,mZ)
title ("Wahrscheinlichkeitsdichtefunktion")
%%Aufgabe 6
subplot(2,1,2)
r=linspace(0,13,40);
phi=linspace(0,2*pi,40);
[mR,mPhi]=meshgrid(r,phi);
mX=mR.*0.5.*sin(mPhi);
mY=mR.^3.*cos(3.*mPhi);
mZ=mX+mY;
surf(mX,mY,mZ)
%%Aufgabe 7
figure(3);
x=linspace(-1,1,1000)
subplot(221)
plot(x,x.^2)
ylabel("x^2")
xlabel("x")
subplot(222)
plot(x,x.^3)
ylabel("x^3")
xlabel("x")
subplot(223)
plot(x,x.^4)
ylabel("x^4")
xlabel("x")
subplot(224)
plot(x,x.^5)
ylabel("x^5")
xlabel("x")






