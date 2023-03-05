function [L, U] = lu_crout(A)
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
    for j = 2: i
    end
%     for j = 1: f-1
%         for i = j + 1: f
%             mul = A(i, j) / A(j, j); % multiplicadores método Gauss
%             A(i, j:c) = A(i, j:c) -  mul * A(j, j:c);
%             L(i, j) = mul;
%         end
%     end
end