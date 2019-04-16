clc; 
clear;
cf=input ('f(x)= ');
f=inline(cf);
b=input('b=');
a=input('a=');
n=input('n=');
valor=f(a);
h=(b-a)/n;
for k=2:2:n-2
	x=a+k*h;
	valor=valor+2*f(x);
end
for k=1:2:n-1
    x=a+k*h;
    valor=valor+4*f(x);
end
valor=valor+f(b);
valor=(h/3)*valor;
fprintf('La aproximación mediante simpson compuesto es: %4.10f\n\n',valor)


