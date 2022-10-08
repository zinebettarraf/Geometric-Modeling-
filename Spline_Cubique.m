function [] = Spline_Cubique(a,b,resolution,matrice)
    derives = derive_cubique(matrice);
    L=menu('voulez-vous afficher sa courbe de courbure ?', 'oui', 'non');
    %eval de la courbe d'interpolation
    courbe_interpole = Hermite_Bez(a,b,resolution,derives,matrice);
    plot(courbe_interpole(1,:),courbe_interpole(2,:),'DisplayName','Spline Cubique');
    legend
    if L==1
        courbure(a,b,resolution,derives,matrice);
        legend('Courbure de spline cubique')
    end