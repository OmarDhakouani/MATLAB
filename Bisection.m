clear all; close all; clc;
%Create brackets
xp = -0.5;
xn = 0.8;
%Calculate the midpoint
xmp = (xn+xp)/2; 
%Calculate y(midpoint)
ymp = 0.5 - sin(xmp) - xmp.^2;
%Define the Bisection Method
while abs(ymp) > 0.001
    if ymp < 0
        % ymp is less than zero
        xn = xmp;
    else
        % ymp is greater than zero
        xp = xmp;
    end
    xmp = (xn + xp) / 2;
    ymp = 0.5 - sin(xmp) - xmp.^2;
end
%Display the root value
xmp
ymp
%Plot the function and the root
xvals = linspace(0.1,0.5);
yvals = 0.5 - sin(xvals) - xvals.^2;
plot(xvals,yvals)
hold on
plot([0.1 0.5],[0 0])
plot(xmp,ymp,"r.","MarkerSize",30)
hold off
grid on