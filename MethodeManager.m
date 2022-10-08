function [] = MethodeManager(a,b,resolution, matrice)
    K = 0;

    while K~=6 % arrêter
       K=menu('Quelle methode ?','Hermite', 'Hermite_v1','Hermite_v2','Lagrange','Spline Cubique','Retour');
       figure(1);
       if K==1
           Hermite(a,b,resolution,matrice);
       elseif K==2
           Hermite_v1(a,b,resolution,matrice);
       elseif K==3
           Hermite_v2(a,b,resolution,matrice);
       elseif K==4
           Lagrange(resolution,matrice);
       elseif K==5
           Spline_Cubique(a,b,resolution,matrice);  
       end
    end