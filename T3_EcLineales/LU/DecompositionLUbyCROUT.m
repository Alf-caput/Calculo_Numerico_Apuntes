% LU decomposition using Crout's method.
% Criated  by Marcelo Borges dos Santos with cooperation of Luis Mauro
% Moura PUC-PR - Brazil
% Exemple pag. 137 Amos Gilat & Vish Subramaniam Numerical Methods for
% Engineering ans Scientists: An Introduction with Application Using Matlab
% Brazilian version
% Outpup : Solution of Linear System, Inverse Matrix, Determinant
clear all 
close all 
clc

% Input numerical matrix A 
a=[4 -2 -3 6;-6 7 6.5 -6; 1 7.5 6.25 5.5;-12 22 15.5 -1];
b=[12;-6.5;16;17];
n=4; % order of matrix A 

for i=1:n
    Lower(i,1)=a(i,1);
end
for i=1:n
    Upper(i,i)=1;
end
for j=1:n
    Upper(1,j)=a(1,j)/Lower(1,1);
end
for j=1:n
    Upper(1,j)=a(1,j)/Lower(1,1);
end
for i = 2:n
    for j = 2:i
        sum = 0;
          for k = 1:j-1
            sum = sum + Lower(i,k)*Upper(k,j);
          end
          Lower(i,j) = a(i,j)-sum;
    end
         for j = i+1:n
            sum = 0;
            for k = 1:i-1
               sum = sum + Lower(i,k)*Upper(k,j);
             end
          Upper(i,j) = (a(i,j)-sum)/Lower(i,i); 
         end
end

% Building Identity matrix 
 for i=1:n
     c=1;
            for j=i:n
                I(i,j)=c;
                c=0;
            end 
 end
 
 % Calculating the determinant 
 det=1;
 for j=1:n
     det=det*Lower(j,j);
 end
 
        % ######IMPORTANT NECESSERY TO INCLUDE PROGRESSIVE AND REGRESSIVE FUNCTION
      
 
         aux=n;                                 % order of matrix
         [y]=Progressive(n,Lower,I,aux);        % n= order of matrix L , aux = order of inverse matrix same value of order of matrix A  
         [inverse_matrix]=Regressive(n,Upper,y,aux);
         
         % Linear System Solved 
          aux=1;                                    % order of vector colum matrix 
          [y]=Progressive(n,Lower,b,aux);           % n= tamanho da matriz L , aux = tamanho da matriz _inversa ou tamanho da vetor fonte  
          [Solution]=Regressive(n,Upper,y,aux);     % Linear System solved. 