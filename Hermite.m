function [] = Hermite(a,b,resolution,matrice)
    drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'HandleVisibility','off'); %function that draw arrows
    
    N=size(matrice,2);
    derives = zeros(2,N);
    P=menu('le choix de m0 et mN', 'par la souris', 'automatiquement');
    if P==1 %par la souris
        % recuperation et affichage de m0
        [xEnd,yEnd]=ginput(1);
        derives(1,1)=xEnd-matrice(1,1);
        derives(2,1)=yEnd-matrice(2,1);
        x1 = [matrice(1,1) xEnd];
        y1 = [matrice(2,1) yEnd];
        drawArrow(x1,y1);
        % recuperation et affichage de mN
        [xEnd,yEnd]=ginput(1);
        derives(1,N)=matrice(1,N)-xEnd;
        derives(2,N)=matrice(2,N)-yEnd;
        x1 = [matrice(1,N) xEnd];
        y1 = [matrice(2,N) yEnd];
        drawArrow(x1,y1);
    end
    % recuperation de la valeur de c
    prompt = {'Enter c value:'};
    dlgtitle = 'Input';
    dims = [1 50];
    definput = {'c='};
    c = str2double(inputdlg(prompt,dlgtitle,dims,definput));
    if P==2 % m0 et mN automatique
        derives(1,1)=(1-c)*(matrice(1,2)-matrice(1,1));
        derives(2,1)=(1-c)*(matrice(2,2)-matrice(2,1));
        derives(1,N)=(1-c)*(matrice(1,N)-matrice(1,N-1));
        derives(2,N)=(1-c)*(matrice(2,N)-matrice(2,N-1));
    end
    % calcul des mi
    miderive = derive_cardinal(c,matrice);
    derives = [derives(1,1), miderive(1,:),derives(1,N);
               derives(2,1), miderive(2,:),derives(2,N)];
    L=menu('voulez-vous afficher sa courbe de courbure ?', 'oui', 'non');
    % eval de la courbe d'interpolation
    courbe_interpole = Hermite_Bez(a,b,resolution,derives,matrice);
    str = strcat('Spline Hermite c =  ',num2str(c));
    plot(courbe_interpole(1,:),courbe_interpole(2,:),'DisplayName',str);
    legend
    if L==1
        courbure(a,b,resolution,derives,matrice);
        str = strcat('Courbure Hermite c =  ',num2str(c));
        legend(str)
    end
