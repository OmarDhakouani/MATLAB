clear all; close all; clc;
%%Ü11.2
figure (1)
[T, Y] = ode45(@odefun_1, [0 20], 0);
plot(T,Y, "LineWidth",2), grid on
figure (2)
[T, Y] = ode45(@odefun_2, [0 10], 1);
plot(T,Y, "LineWidth",2), grid on
figure (3)
tspan=linspace(0,3,1000);
[T, Y] = ode45(@odefun_3,tspan , 3);
plot(T,Y, "LineWidth",2), grid on
figure (4)
[T, Y] = ode45(@odefun_4, [0 10], 1);
plot(T,Y, "LineWidth",2), grid on
figure (5)
[T, Y] = ode45(@odefun_5, [0 0.9], 1);
plot(T,Y, "LineWidth",2), grid on
%%Ü11.3
figure(6)
[T, Y] = ode45(@odefun_6, [0 10],[1;-1]);
plot(T,Y, "LineWidth",2), grid on
%%Ü11.4
figure(7)
[T, Y] = ode45(@odefun_7, [0 10],[0;1]);
plot(T,Y, "LineWidth",2), grid on

function dydt_1= odefun_1(t,y)
    dydt_1=-26*sin(t)-5*y;
end
function dydt_2= odefun_2(t,y)
    dydt_2=cos(t)-y;
end
function dydt_3= odefun_3(t,y)
    dydt_3=cos(t)*y^2;
end
function dydt_4= odefun_4(t,y)
    dydt_4=y+exp(t);
end
function dydt_5= odefun_5(t,y)
    dydt_5=y^2;
end
function dydt_6 = odefun_6(t,y)
dydt_6 = zeros(2,1);
dydt_6(1)= 9*y(1) + 4*y(2) ;
dydt_6(2)= -2*y(1) + 2*y(2) ;
end
function dydt_7 = odefun_7(t,y)
dydt_7 = zeros(2,1);
dydt_7(1)= y(2) ;
dydt_7(2)= -(y(1)+y(1)*y(2)) ;
end