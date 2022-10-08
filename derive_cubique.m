function [derives]= derive_cubique(matrice)
%N>2
N =size(matrice,2);
col =3*[matrice(:,2)-matrice(:,1),matrice(:,3:N)-matrice(:,1:N-2),matrice(:,N)-matrice(:,N-1)];
v = diag(eye(N));
% diag(v,1) or diag(v,1) increase lines and columns
temp1 = (diag(v,-1));
matrice1 = temp1(1:N,1:N);
temp2 = diag(v,1);
matrice2 = temp2(1:N,1:N);
matrice3 = 4*diag(v);
matrice3(1,1) = 2;
matrice3(N,N) = 2;
A = matrice1 + matrice2 + matrice3;
derives=(A\(col.')).';



