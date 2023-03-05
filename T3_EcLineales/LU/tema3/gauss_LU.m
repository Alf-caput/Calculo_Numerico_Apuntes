function [L, U] = gauss_LU(A)
    [F, C]=size(A);
    L = eye(F);
    for j=1:F-1
        for i=j+1:F
        % Falta hacer el if Ab(j,j) == 0, pivoteo parcial 
        % intercambiar filas segun sea el mayor valor absoluto del pivote
            L(i:C,j) = A(i,j)/A(j,j);
            A(i,j:C)=A(i,j:C)-A(i,j)/A(j,j)*A(j,j:C);
            
        end
    end
    U = A;
end