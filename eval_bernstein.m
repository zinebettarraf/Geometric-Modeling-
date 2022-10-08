function [Bezier_curve_points]= eval_bernstein(matrice,a,b,resolution)

n=size(matrice,2)-1 % degre de courbe avec n+1 points de controle
%temps=1:resolution;
temps= a : ((b-a)/resolution) : b;
cp = 0;
for t=temps
   for i=0:n
      % Evaluation du polynome de Bernstein B_i^n(t)
      vect_bernstein(i+1)= ((factorial(n)/(factorial(i)*factorial(n-i))) / (b-a)^n) * (b-t)^(n-i)*(t-a)^i;
   end
   % Calcul du point de la courbe x(t) = Sum b_i * B_i^n(t)
   cp = cp+1;
   Bezier_curve_points(1,cp)=sum(matrice(1,:).*vect_bernstein);
   Bezier_curve_points(2,cp)=sum(matrice(2,:).*vect_bernstein);
end                  

% affichage de la courbe de B�zier
%plot(abscisse,ordonnee,'r')
