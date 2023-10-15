clear all; close all; clc;
%Cubic Root of 8
fun38=@(x)x.^3-8
fplot(fun38,[-5,5])
grid on
x0=[1,3]
root38=fzero(fun38,x0)
%Square Root of 2
fun22=@(x)x.^2-2
fplot(fun22,[-3,3])
grid on
x0=[1 2]
root22=fzero(fun22,x0)
two=root22.^2
%5th Root of 12
fun512=@(x)x.^5-12
fplot(fun512,[-5,5])
grid on
x0=[0 2]
root512=fzero(fun512,x0)
twelve=root512.^5