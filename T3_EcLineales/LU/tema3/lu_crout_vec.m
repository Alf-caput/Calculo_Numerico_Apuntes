function [L, U] = lu_crout_vec(A)
% Función que realiza descomposición LU.
% El algoritmo utilizado es el Método de Crout para descomposición LU.
% Inputs: 
% A = matriz de coeficientes
% Outputs:
% L = matriz triangular inferior (lower)
% U = matriz triangular superior (upper)
    [f, c] = size(A);
    L = zeros(f, c);
    L(:, 1) = A(:, 1);
    U = eye(f, c);
    U(1, 2:c) = A(1, 2:c) / L(1, 1);
    
    for i = 2: f % 
        for j = 2: i % nº de iteraciones = nº de L a obtener en la fila
            L(i, j) = A(i, j) - L(j, 1: j-1)*U(1: j-1, j);
        end
        for j = 2: f-i+1 % nº de iteraciones = nº de U a obtener en la fila
            U(i, j+1) = (A(i, j+1) - L(i, 1: i-1)*U(1: i-1, j+1)) / L(i, i);
        end
    end
end