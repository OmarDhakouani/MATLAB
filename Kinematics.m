t = linspace(0,3.5);
tRange=[0 3.5]
Y0=[0;15;0]
[tSol,YSol]=ode45(@motionFunc,tRange,Y0)
figure(1)
a=YSol(:,3)
plot(tSol,a)
ylabel("Acceleration")
xlabel("Time")
figure(2)
v=YSol(:,2)
plot(tSol,v)
ylabel("Velocity")
xlabel("Time")
figure(3)
y=YSol(:,1)
plot(tSol,y)
ylabel("Position")
xlabel("Time")

function dYdt = motionFunc(t,Y)

% Extract v and a from the second and third elements of vector Y
v = Y(2);
a = Y(3);

% Calculate da/dat
dadt = t.^5 - 5.2*t.^4 + 5*t.^3 + 5*t.^2 - 6*t;

% Calculate dv/dt
dvdt = a;

% Calculate dy/dt
dydt = v;

%Store derivatives to output vector
dYdt = [dydt;dvdt;dadt];

end