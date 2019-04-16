clc; clear;
fprintf('\t\t\tModelo lote económico\n\n');

%Datos

n=4;            %cantidad de artículos
D=[10,20,5,10];
K=[100,50,90,20];
h=[0.1,0.2,0.2,0.1];
restriccion=95/365;
lambda=0;
lambdaInc=1;    %incremento de lambda.
iMax=100;       %iteraciones máximas.
%Solucion
tabla=zeros(iMax,n+2);
i=1;

while (1)
    tabla(i,1)=lambda;
    for j=1:n
        tabla(i,j+1)=sqrt(2*(D(j)*K(j)-D(j)*lambda)/h(j));
    end
    
    pedidoDiario=0;
    for k=1:n
        pedidoDiario=pedidoDiario+D(k)/tabla(i,k+1);
    end
    tabla(i,n+2)=restriccion-pedidoDiario;
       
    if(i==iMax || tabla(i,n+2)>0)
        break;
    end
    
    i=i+1;
    lambda=lambda-lambdaInc;
end

%Resultados

disp(tabla(1:i,:));
if(i==iMax)
    disp('El script se detuvo por iteraciones');
    disp('Se recomienda usar un incremento mayor');
else 
    disp('El script se detuvo por restricción');
    if(tabla(i,n+2)>0.01)
        disp('Se recomienda usar un incremento menor')
    else
        disp('El óptimo es:');
        disp(tabla(i,2:n+1));
    end
end