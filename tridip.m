function X=tridip(Da,Dd,Dc,b)

n=length(Dd);
mat=zeros(n,n);

% X Vector solucion.
[m,n]=size(mat);
% Construimos el vector escala en base a los tres vectores

E(1)=max(abs(Dd(1)),abs(Dc(1)));
for i=2:n-1
    E(i)=max(max(abs(Da(i-1)),abs(Dd(i))),abs(Dc(i)));
end
E(n)=max(abs(Dd(n)),abs(Da(n-1)));

% vector  historia
h=1:n;

% 
for i=1:n
    for j=1:n
     if i==j
        mat(i,j)=Dd(i);
     else
       if j==i-1
           mat(i,j)=Da(j);
       else
           if i==j-1
               mat(i,j)=Dc(i);
           end 
       end
     end
    end
end



%al momento de seleccionar el pivote solo elegiremos ahora entre dos
%pivotes, el pivote k y el pivote k+1, ya que conforme avanzamos,en la
%columna siguiente a verificar solo tendremos dos pivotes

for k=1:n-1	
maxi=0;
 for i=k:k+1
r=abs(mat(h(i),k))/E(h(i));
if (maxi<=r)
maxi=r;
hi=i;
end
 end
aux=h(k);
h(k)=h(hi);
h(hi)=aux; 	

  %ahora sabemos que por ser matriz tridiagonal los demas elementos en cada
 %columna seran cero, excepto uno, el cual debemos de eliminar, por lo que
 %solo eliminaremos el siguiente elemento a partir de la fila donde estamos
 %(al eliminar la siguiente fila debemos de acerlo de acuerdo al vector
 %historia
 L=-mat(h(k+1),k)/mat(h(k),k);
  b(h(k+1))=b(h(k+1))+L*b(h(k));     
 
              for j=k:n
                   mat(h(i),j)=mat(h(i),j)+L*mat(h(k),j);
             end
       
 
end

%sustitucion  hacia atras
X(h(n))=b(h(n))/mat(h(n),n);
for k=(n-1):-1:1
s=0;
for  i=k+1:n
s=s+mat(h(k),i)*X(h(i));
end
X(h(k))=(b(h(k))-s)/mat(h(k),k);
end

 I=eye(n);
        
        for n=1:n
        W(n,:)=I(h(n),:);
        end
        
        X=W*X';








end