function [L, U] = lu_gauss(A)
% Función que realiza descomposición LU.
% El algoritmo utilizado es el Método de Gauss para descomposición LU.
% Inputs: 
% A = matriz de coeficientes
% Outputs:
% L = matriz triangular inferior (lower)
% U = matriz triangular superior (upper)
    [f, c] = size(A);
    L = zeros(f, c);
    for j = 1: f-1
        for i = j + 1: f
            mul = A(i, j) / A(j, j); % multiplicadores método Gauss
            A(i, j:c) = A(i, j:c) -  mul * A(j, j:c);
            L(i, j) = mul;
        end
    end
    L = L + eye(f, c);
    U = A;
end