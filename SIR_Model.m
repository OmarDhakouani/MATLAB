clear all;close all;clc
tRange=[0 14]      %time span
Y0=[999,1,0]       %initial values
[tSol,YSol]=ode45(@SIRmodel,tRange,Y0)
S=YSol(:,1)        %extracting individual solutions 
I=YSol(:,2)        %from the solution row vector
R=YSol(:,3)
plot(tSol,S)
hold on 
plot(tSol,I)
plot(tSol,R)
hold off
legend("susceptible","infected","recovered")
[maxI,idx]=max(I)   %maximum value of infected population
peakFlu=tSol(idx)   %time of peak infection 
noFlu=S(end)        %people who were never infected
function dYdt=SIRmodel(t,Y)%define the ODE function
    % Extract S, I, and R from input vector Y
    S=Y(1)
    I=Y(2)
    R=Y(3)
    % Define the constants r and a
    r=0.00218
    a=0.5
    % Define dSdt, dIdt, dRdt from the ODEs
    dSdt=-r.*S.*I
    dIdt=r.*S.*I-a.*I
    dRdt=a.*I
    % Create output column vector dYdt
    dYdt=[dSdt;dIdt;dRdt]
end