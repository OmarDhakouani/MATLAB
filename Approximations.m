%%Aufgabe 1
figure (1)
x = [0 1 2 3 4 5]
y = [0 0.632 0.865 0.95 0.982 0.993]
p =polyfit(x,y,5)
grid on 
plot(x,y)
xf=0:.001:5;
yf=polyval(p,xf)
grid on 
hold on
plot(xf,yf,'-')
xlabel('x');
ylabel('y');
y_hat=polyval(p,x)
MSE=1/length(y)*sum((y_hat-y).^2)

%%Aufgabe 2
figure(2)
x = 0:0.5:2*pi;
y = sin(x);
plot(x,y)
xlabel('x \rightarrow');
ylabel('y \rightarrow');
hold on
p1 = polyfit(x,y,5);
x1 = 0: 0.1: 2*pi;
y1 = polyval(p1,x1);
plot(x1,y1,'-','LineWidth',2)
p2 = polyfit(x,y,5);
x2 = (-2*pi): 0.001: 4*pi;
y2 = polyval(p2,x2);
plot(x2,y2,'--','LineWidth',2)
legend('sin(x)','Abtasperiode 1', ' Abtastperiode 2');
axis([-2*pi 4*pi -2 2])

figure(3)
x = 0:0.5:2*pi;
y = sin(x);
plot(x,y)
xlabel('x \rightarrow');
ylabel('y \rightarrow');
hold on
p1 = polyfit(x,y,7);
x1 = 0: 0.1: 2*pi;
y1 = polyval(p1,x1);
plot(x1,y1,'-','LineWidth',2)
p2 = polyfit(x,y,7);
x2 = -2*pi: 0.001: 4*pi;
y2 = polyval(p2,x2);
plot(x2,y2,'--','LineWidth',2)
legend('sin(x)','Abtasperiode 1', ' Abtastperiode 2');
axis([-2*pi 4*pi -2 2])

%%Aufgabe 3
figure (4)
n = 10;
x4 = -2*pi:0.5:2*pi;
y4 = sin(x4).^3;
p = polyfit(x4,y4,n);
xf= -2*pi:0.001:2*pi;
yf=sin(xf).^3;
yp=polyval(p,xf);
yspline=spline(x4,y4,10);
plot(x4,y4,'x')
hold on 
grid on 
plot(xf,yf,'-')
plot(xf,yp,'--')
plot(xf,yspline,'--')
xlabel('x')
ylabel('y')
legend('Abtastung','Hochauflösend','polyfit','Spline')

%%Aufgabe 4
syms x
figure (5)
y= exp(x)
yt=taylor(y,'ExpansionPoint',0,'Order',5)
yfn1 = matlabFunction(yt)
x_num= -4:0.1:4
y_num= exp(x_num)
y_num_tay=yfn1(x_num)
plot (x_num,y_num,'-')
hold on 
grid on 
plot (x_num,y_num_tay,'--')


figure (6)
y= log(x)
yt=taylor(y,'ExpansionPoint',1,'Order',9)
yfn2 = matlabFunction(yt)
x_num= 0.00001:0.1:3
y_num= log(x_num)
y_num_tay=yfn2(x_num)
plot (x_num,y_num,'-')
hold on 
grid on 
plot (x_num,y_num_tay,'--')






















