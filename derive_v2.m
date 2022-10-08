function [derives3]= derive_v2(matrice)
N=size(matrice,2);
derives3 = zeros(2,N-2);
for i=1:N-2
    derives3(1,i)=(-3*matrice(1,i)+4*matrice(1,i+1)-matrice(1,i+2))/2;
    derives3(2,i)=(-3*matrice(2,i)+4*matrice(2,i+1)-matrice(2,i+2))/2;
end
   % mN-1 et mN automatique
   derives3(1,N-1)=matrice(1,N-1)-matrice(1,N-2);
   derives3(2,N-1)=matrice(2,N-1)-matrice(2,N-2);
   derives3(1,N)=matrice(1,N)-matrice(1,N-1);
   derives3(2,N)=matrice(2,N)-matrice(2,N-1);
end