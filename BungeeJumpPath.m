syms y(t) b k
m = 75
assume(y(t),'real')
assume([b k],'positive')
bungeeEqn = m*diff(y,t,2) + b*diff(y,t) + k*y == 0
ic = y(0) == 75
dy(t) = diff(y,t)
ic2 = dy(0) == 0
ysol=dsolve(bungeeEqn,[ic ic2])
yequil= subs(ysol,[b k],[4 8])
figure(1)
fplot(yequil,[0 150])
ygnd=yequil+77
figure(2)
fplot(ygnd,[0 150])
d = sqrt(1+(diff(yequil,t))^2)
L = int(d,0,100)