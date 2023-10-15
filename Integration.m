close all; clear all; clc;
%%Aufgabe 10.1
x=linspace(-2*pi,2*pi,1000);
y=(sin(x)).^2;
z = cumtrapz(x,y) ;
figure(1)
plot(x,y,x,z)
grid on

%%Aufgabe 10.2
%a
fx=@(x)(sin(x)).^2;
I=quad(fx,-2*pi,2*pi)
%b
yx=@(x)x.*exp(x);
J=quad(yx,-1,1)
%c
x=linspace(-1,1,100);
f=@(x) 1./(1+x.^2);
y=f(x);
h=x(2)-x(1);
AR=sum(y(1:end-1))*h
AT=AR+0.5*h*sum(y(2:end)-y(1:end-1))
AQ=quad(f,-1,1)
FT=AQ-AT
FR=AQ-AR

%%Aufgabe 10.3
zxy=@(x,y)(1/(2*pi))*exp(-((x.^2+y.^2)/2));
q=dblquad(zxy,-2*pi,2*pi,-2*pi,2*pi)
vX=linspace(-2*pi,2*pi,100);
vY=linspace(-2*pi,2*pi,100);
[mX,mY]=meshgrid(vX,vY);
mF=zxy(mX,mY);
surf(mX,mY,mF)

%%Aufgabe 10.4
fxy=@(x,y)(1/(2*pi))*exp(-((x.^2+y.^2)/2));
frt=@(r,t)((1/(2*pi))*exp(-(((r.*cos(t)).^2+(r.*sin(t)).^2)/2))).*r;
q=dblquad(frt,0,3,0,2*pi)
vr = linspace(0,3,20); 
vt = linspace(0,2*pi,50); 
[mr,mt] = meshgrid(vr,vt);
mFrt = frt(mr,mt); 
dr = vr(2)-vr(1);
dt = vt(2)-vt(1); 
I = sum(sum(mFrt))*dr*dt 

%%Aufgabe 10.5
syms x
I1=int(x*log(1+x))
I2=int(x*log(x),0,1)
syms t
I3=int(2*x,sin(t),1)