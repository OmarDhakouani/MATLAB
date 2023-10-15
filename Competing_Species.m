dx=@(x,y) x./1000.*(1000-x-0.8.*y)
dy=@(x,y) y./500.*(500-0.15.*x-y)
fimplicit(dx,[-100,1500])
hold on
grid on
fimplicit(dy,[-100,1500])
hold off