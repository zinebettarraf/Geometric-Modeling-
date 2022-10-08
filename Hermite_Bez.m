function [courbe_interpol] = Hermite_Bez(a,b,resolution,derives,matrice)
N=size(matrice,2);
courbe_interpol = [matrice(1,1);matrice(2,1)];
for i=1:N-1
    controle = [matrice(1,i) matrice(1,i)+(1/3)*derives(1,i) matrice(1,i+1)-(1/3)*derives(1,i+1) matrice(1,i+1);
                matrice(2,i) matrice(2,i)+(1/3)*derives(2,i) matrice(2,i+1)-(1/3)*derives(2,i+1) matrice(2,i+1)];
    %for i=1:4
    %    plot(controle(1,i),controle(2,i),'o');
    %end
    courbe_bezier = eval_bernstein(controle,a,b,resolution);
    courbe_interpol=[courbe_interpol(1,:),courbe_bezier(1,:);
                     courbe_interpol(2,:),courbe_bezier(2,:)];
end

