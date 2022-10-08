function [] = Lagrange(resolution,matrice)
    n=size(matrice,2)-1;
    temps= 0 : 1/resolution : n;
    cp = 0;
    vect_p_x(1,:) = matrice(1,:);
    vect_p_y(1,:) = matrice(2,:);
    for t=temps
       % Calcul du p(t)
        for k=2:n+1
            for i=1:n-k+2
                vect_p_x(k,i) = ((i-1+k-1-t)/(k-1))*vect_p_x(k-1,i)+((t- i+1)/(k-1))*vect_p_x(k-1,i+1);
                vect_p_y(k,i) = ((i-1+k-1-t)/(k-1))*vect_p_y(k-1,i)+((t-i+1)/(k-1))*vect_p_y(k-1,i+1);
            end
        end
        cp=cp+1;
        courbe_Ait_Nev(1,cp)=vect_p_x(n+1,1);
        courbe_Ait_Nev(2,cp)=vect_p_y(n+1,1);
    end
    plot(courbe_Ait_Nev(1,:),courbe_Ait_Nev(2,:),'DisplayName','Lagrange');
    legend