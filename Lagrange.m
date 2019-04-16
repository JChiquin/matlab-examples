clc; clear;
fprintf('\t\tINTERPOLACIÓN LAGRANGE\n');
n=input('ingrese el grado del polinomio, n=');
pregunta=menu('Seleccione en que forma ingresará los datos','Función y abscisas','Puntos (x,y)');
if (pregunta==1)
    f=inline(input ('f(x)= ','s'));
    fprintf('Se necesitan %.0f puntos\n',n+1);
    fprintf('Ingrese el valor de las abscisas\n');
    X=linspace(0,0,n+1);
    Y=linspace(0,0,n+1);
    for i=1:n+1
        fprintf('x%.0f=',i-1);
        X(i)=input(' ');
        Y(i)=f(X(i));
    end
else
    fprintf('Se necesitan %.0f puntos\n',n+1);
    fprintf('Ingrese los puntos\n');
    X=linspace(0,0,n+1);
    Y=linspace(0,0,n+1);
    for i=1:n+1
        fprintf('x%.0f=',i-1);
        X(i)=input(' ');
        fprintf('y%.0f=',i-1);
        Y(i)=input(' ');
    end
end

disp('El polinomio interpolado es');
syms x
polinomio=0;
for i=1:n+1
    P=1;
    for j=1:n+1
        if(j==i)
            continue;
        end
        P=P*(x-X(j))/(X(i)-X(j));
    end  
    polinomio=polinomio+Y(i)*P;
end
polinomio=expand(polinomio);
pretty(polinomio);
x=input('ingrese el valor de x a interpolar,x=');
valor=eval(polinomio);
fprintf('el valor interpolado es %4.10f\n',valor);
fprintf('\t\t\t\tProgramado por Jorge Chiquín\n');
