function  graficaPol(a,b,c,d,a2,b2,c2,d2,X,Y,t)

n=length(a);
 hold on; 
%axis([0 1 0 1]);
 

%graficamos los puntos ingresados
for i=1:n; 
       plot (X(i),Y(i),'o','MarkerFaceColor','y','LineWidth',1); 
        hold on; 
end



%creamos el polinomio de acuerdo a los coeficeintes a,b,c y d y lo
%graficamos evaluandolo en el intervalo correspondiente a cada polinomio
for i=1:n-1; 
    x=t(i):0.010:t(i+1);
    equis=a(i)+b(i)*(x-t(i))+c(i)*(x-t(i)).^2+d(i)*(x-t(i)).^3;
    ye=a2(i)+b2(i)*(x-t(i))+c2(i)*(x-t(i)).^2+d2(i)*(x-t(i)).^3;
    hold on; 
    plot(equis,ye,'k','LineWidth',2); 
end





end