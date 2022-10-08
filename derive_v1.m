function [derives]= derive_v1(alpha,matrice)
N=size(matrice,2);
derives = zeros(2,N-2);
for i=2:N-1
    derives(1,i-1)=(1/alpha)*(matrice(1,i+1)-matrice(1,i-1));
    derives(2,i-1)=(1/alpha)*(matrice(2,i+1)-matrice(2,i-1));
end
