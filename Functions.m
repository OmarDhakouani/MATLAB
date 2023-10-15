close all; clear all; clc;
%%Aufgabe 1
figure (1)
x=-5:.05:5;
g_x=1 ./ sqrt(abs(1 - 0.25*x.^2)); %Definitionsbereich R-[-2;2] Wertebereich R Symmetriepunkt (0,1)
f_x=1 ./ sqrt(1 - 0.25*x.^2);%Definitionsbereich [-2;2] Wertebereich [1;4,5] 
plot( x , g_x , '-r' )
hold on ;
plot( x , f_x , '-b' )
%ylabel('f(x) , g(x) \rightarrow')
%%Aufgabe 2
g2_x = 1./sqrt(abs(1-0.25*(x-1).^2)) ;
plot(x,g2_x,'-g')
g3_x = 1./sqrt(abs(1-0.25*(x.*2).^2)) ;
plot(x,g3_x,'-m');
g4_x = 1./sqrt(abs(1-0.25*(x.*2-1).^2)) ;
plot(x,g4_x,'-k');
g5_x = 1./sqrt(abs(1-0.25*(x.^2).^2)) ;
plot(x,g5_x,'-c');
xlabel('x \rightarrow') 
legend('f(x)' , 'g(x)', 'g2(x)','g3(x)','g4(x)','g5(x)')
hold off ;
%%Aufgabe 3
f=0:1:20;
H_f= (((20*pi.*f).^2)./(((1-1000*((2*pi.*f).^2)).^2)+((20*pi.*f).^2)));
figure (2)
plot(f,H_f,'-b')
xlabel('f \rightarrow')
ylabel('|H(2*pi*f)|^2 \rightarrow')
grid on;
hold on ;
plot(f(1:end-1),diff(H_f)./diff(f),'-r')
title('Approximate derivation')
legend('|H(2*pi*f)|^2', 'd|H(2*pi*f)|^2/df')
%%Aufgabe 4
O=((20*pi.*f).^2);
U=(((1-1000*((2*pi.*f).^2)).^2)+((20*pi.*f).^2));
[Q,D]= polyder(O,U);
N=roots(Q);






















