function [x,k] = Jacobi_mat(A,b, ermax)
% Resuelve Ax=b por Jacobi en su forma matricial
% Variables de entrada: A = matriz de coeficientes, b = vector columna 
% de términos independientes, ermax = error máximo admitido
% Variables de salida: x = vector columna solución, k = número de
% iteraciones empleadas
    n = length(b); 
    x = zeros(n,1); 
    k = 0; sm = 1; 
    D = diag(A); 
    r = A - diag(D);
    while sm > ermax
        y = (b - r*x)./ D; 
        sm = max(abs(x-y)) / max(abs(y)); 
        x = y;
        k = k+1;
    end
end