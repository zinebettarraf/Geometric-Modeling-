function [derives]= derive_cardinal(c,matrice)
N=size(matrice,2);
derives = zeros(2,N-2);
for i=2:N-1
    derives(1,i-1)=(1-c)*(matrice(1,i+1)-matrice(1,i-1))/2;
    derives(2,i-1)=(1-c)*(matrice(2,i+1)-matrice(2,i-1))/2;
end
