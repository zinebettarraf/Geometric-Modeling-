resolution=21;      
a=2;b=4;
K=0;
matrice=0;

while K~=4 % arrêter
   K=menu('Que voulez-vous faire ?','NEW   (bouton souris, puis <ENTER>', 'AJOUTER UN POINT','SUPPRIMER UN POINT','ARRETER');
   if K==1 % NEW
      close all
      figure(1)            % affichage d'une fenetre vide
      hold on              % tous les plot seront exécutés sur cette meme fenetre
      axis([0 10 0 10])    % les axes sont definitivement fixes
      %axis off
      matrice=0;
      for i=1:1000         % on limite le nombre de points de controle à 1000
         [X,Y]=ginput(1);  % prise en compte d'un clic de souris
         if isempty(X)     % si on appuie sur <ENTER>
            break
         end
         matrice(1,i)=X;   % coordonnees x des points de controle
         matrice(2,i)=Y;   % coordonnees y des points de controle
         plot(matrice(1,i),matrice(2,i),'o','HandleVisibility','off') % affichage du point de controle i
         plot(matrice(1,:),matrice(2,:),'b','HandleVisibility','off') % affichage du polygone de controle
      end
      %%%%%%%%%%%%%%%
      MethodeManager(a,b,resolution, matrice);
      %%%%%%%%%%%%%%%
   elseif K==2 % ajouter un point
     [X,Y]=ginput(1);
     while ~isempty(X)
         n=size(matrice,2);
         matrice(1,n+1)=X;
         matrice(2,n+1)=Y; 
         clf              
         hold on              % tous les plot seront executes sur cette meme fenetre
         axis([0 10 0 10])    % les axes sont definitivement fixes
         %axis off
         for k=1:n+1
             plot(matrice(1,k), matrice(2,k),'o','HandleVisibility','off') % affichage du point de controle k
         end
         plot(matrice(1,:),matrice(2,:),'b','HandleVisibility','off') % affichage du polygone de controle
         [X,Y]=ginput(1);
     end
         %%%%%%%%%%%%%%
         MethodeManager(a,b,resolution, matrice);
         %%%%%%%%%%%%%%%
   elseif K==3 % supprimer un point
      
      [X,Y]=ginput(1);
      while ~isempty(X)
         if size(matrice,2)==1
            break
         end
         matrice=supprimer_point(matrice,X,Y);
         n=size(matrice,2);
         clf              
         hold on              % tous les plot seront executes sur cette meme fenetre
         axis([0 10 0 10])    % les axes sont definitivement fixes
         %axis off
         for k=1:n 
             plot(matrice(1,k), matrice(2,k),'o','HandleVisibility','off') % affichage du point de controle k
         end
         plot(matrice(1,:),matrice(2,:),'b','HandleVisibility','off') % affichage du polygone de controle
         [X,Y]=ginput(1);
      end
      %%%%%%%%%%%%%%%
      MethodeManager(a,b,resolution, matrice);
      %%%%%%%%%%%%%%%
   end
end
close all
