[X,Y]=leePuntos;
%debido a que las curvas que queremos graficar pueden ser complicadas
%entonces procedemos a parametrizar la curva con un parametro t de 1 a n
%esto significa crear dos funciones tales que Xi=x(ti) y Yi=y(ti) para
%i=0,1,.....,n;
n=length(X);
t=[1:n]';
[a,b,c,d]=splineCub(t,X);
[a2,b2,c2,d2]=splineCub(t,Y);
graficaPol(a,b,c,d,a2,b2,c2,d2,X,Y,t);