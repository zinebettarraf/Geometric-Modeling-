function [] = Hermite_v2(a,b,resolution,matrice)
    derives = derive_v2(matrice);
    P=menu('voulez-vous afficher sa courbe de courbure ?', 'oui', 'non');
    %eval de la courbe d'interpolation
    courbe_interpole = Hermite_Bez(a,b,resolution,derives,matrice);
    plot(courbe_interpole(1,:),courbe_interpole(2,:),'DisplayName','Spline Hermite-v2');
    legend
    if P==1
        courbure(a,b,resolution,derives,matrice);
        legend('Courbure Hermite-v2')
    end