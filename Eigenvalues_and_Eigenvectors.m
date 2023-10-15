clear all; close all; clc;
%%Aufgabe 7.1
%a
A1=[2 2 1; 1 3 1; 1 2 2]
[V1,D1]=eig(A1)
detV1=det (V1)
%b
A2=[-3 -7 -5; 2 4 3; 1 2 2]
[V2,D2]=eig(A2)
detV2=det(V2)
%c
A3=[2 1 -1; -1 0 1; -1 -1 2]
[V3,D3]=eig(A3)
detV3=det(A3)
%d
A4=[0 -2 -1; -1 1 2; -1 -1 2]
[V4,D4]=eig(A4)
detV4=det(V4)
%e
A5=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]
[V5,D5]=eig(A5)
detV5=det(V5)
%f
A6=[1 2 3; 0 3 5; 0 0 7]
[V6,D6]=eig(A6)
detV6=det(V6)
%%Aufgabe 7.2
%a
A7=[2 1 0; 1 2 0; 0 0 2]
[V7,D7]=eig(A6)
VHV7= V7*V7'
%b
A8=[2 2 0; 2 5 0; 0 0 3]
[V8,D8]=eig(A6)
VHV8= V8*V8'
%c
A9=pascal(3)
[V9,D9]=eig(A9)
VHV9= V9*V9'
%%Aufgabe 7.3
%A
A=[1 1 1 1; 1 2 3 4; 1 3 6 10; 1 4 10 20]
A==A.'
[V,D]=eig(A)
[V1,D1]=eig(A^5)
D==D1
A^3==V*D^3*V^-1
%B
B=[3 2 1 0; 2 3 1 0; 1 1 3 0; 0 0 0 3]
B==B.'
[V,D]=eig(B)
[V2,D2]=eig(B^5)
V2==V
B^5==V*D^5*V^-1
%%Aufgabe 7.4
A=[3 4; 1 2]
I=[1 0; 0 1]
c=poly(A)
A^2- 5*A +2*I == 0
B=[1 1 1; 1 2 3; 1 3 6]
I=[1 0 0; 0 1 0; 0 0 1]
c=poly(B)
B^3- 9*B^2 +9*B-I == 0