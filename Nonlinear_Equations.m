mySph=@(x,y,z) x.^2+y.^2+z.^2-3;
myPlane=@(x,y,z) 3.*x - 2.*y + z -2;
myFun=@(x,y,z) sin(x).*cos(y)+z;
fimplicit3(myFun,"b","FaceAlpha",0.4)
hold on
fimplicit3(mySph,"y","FaceAlpha",0.4)
fimplicit3(myPlane,"r","FaceAlpha",0.4)
legend("Fun","Sphere","Plane")
hold off
mySystem = @(w) [ mySph(w(1),w(2),w(3));
           myPlane(w(1),w(2),w(3));
           myFun(w(1),w(2),w(3)) ]
wRoot=fsolve(mySystem,[-0.5,-1.5,-0.5])
