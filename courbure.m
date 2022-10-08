function [] = courbure(a,b,resolution,derives,matrice)
    N=size(matrice,2);
    courbe_courbure = 0;
    % parcours des points d'interpolation
    for i=1:N-1
        
        controle_bez = [matrice(1,i) matrice(1,i)+(1/3)*derives(1,i) matrice(1,i+1)-(1/3)*derives(1,i+1) matrice(1,i+1);
                        matrice(2,i) matrice(2,i)+(1/3)*derives(2,i) matrice(2,i+1)-(1/3)*derives(2,i+1) matrice(2,i+1)];
        
        controle_seconde = [6*(controle_bez(1,3)-2*controle_bez(1,2)+controle_bez(1,1)) 6*(controle_bez(1,4)-2*controle_bez(1,3)+controle_bez(1,2));
                            6*(controle_bez(2,3)-2*controle_bez(2,2)+controle_bez(2,1)) 6*(controle_bez(2,4)-2*controle_bez(2,3)+controle_bez(2,2))];               
        courbe_seconde = eval_bernstein(controle_seconde,a,b,resolution);
        
        controle_prime = [3*(controle_bez(1,2)-controle_bez(1,1)) 3*(controle_bez(1,3)-controle_bez(1,2)) 3*(controle_bez(1,4)-controle_bez(1,3));
                          3*(controle_bez(2,2)-controle_bez(2,1)) 3*(controle_bez(2,3)-controle_bez(2,2)) 3*(controle_bez(2,4)-controle_bez(2,3))];
        courbe_prime = eval_bernstein(controle_prime,a,b,resolution);
        
        norme_prime = (sqrt(courbe_prime(1,:).^2+courbe_prime(2,:).^2)).^3;
        for k=1:resolution+1 
            courbe_courbure(2,k+resolution*i)= det([courbe_prime(:,k) courbe_seconde(:,k)])/norme_prime(k);
            courbe_courbure(1,k+resolution*i)= (k-1)/resolution + (i-1);
        end
    end
    figure();
    plot(courbe_courbure(1,:),courbe_courbure(2,:));
