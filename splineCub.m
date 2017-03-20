function [a,b,c,d]=splineCub(X,Y)

%la idea del spline cubico es, no crear un unico polinomio que pase por
%todos los puntos dados, la nueva idea es dividir el intervalo formado por
%el punto inicial al punto final por intervalos y para cada intervalo crear
%un polinomio de la forma p(x)=a+b*x+c*x^2+d*x^3
n=length(X);

for i=1:n-1; 
    h(i)=X(i+1)-X(i); 
end

for i=1:n; 
    a(i)=Y(i); 
end




%debemos crear el sistema de ecuaciones el cual al resolverlo nos dara el
%valor del coeficiente c de cada polinomio
for i=2:n-1; 
    g(i)=3/h(i)*(a(i+1)-a(i))-3/h(i-1)*(a(i)-a(i-1)); 
     Dd(i)=2*(h(i-1)+h(i)); 
end
g(1)=0;
g(n)=0;
Dd(1)=1;
Dd(n)=1;

for i=1:n-2; 
   Da(i)=h(i); 
end
Da(n-1)=0;


for i=2:n-1; 
   Dc(i)=h(i); 
end
Dc(1)=0;


%el sistema generado es un sitema tridiagonal el cual procedemos a
%solucioar para encontrar el coeficiente c
c=tridip(Da,Dd,Dc,g)';


for i=n-1:-1:1; 
    b(i)=(a(i+1)-a(i))/h(i)-h(i)*(c(i+1)+2*c(i))/3; 
    d(i)=(c(i+1)-c(i))/(3*h(i)); 
end


