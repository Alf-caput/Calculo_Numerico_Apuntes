function [L,U] = descomposicion_LU(A)
    [F, F]=size(A);
    L = zeros(F);
    % Diagonal de U compuesta por unos
    U = eye(F);
    % Primera columa de L es igual a la primera columna de A
    L(:,1) = A(:,1);
    % Primera fila de U es igual a A(1,:) / L(1,1)
    U(1,:) = A(1,:)/L(1,1);
    for i=2:F
        for j=2:i
            L(i,j)   = A(i,j) - L(i,1:j-1)*U(1:j-1,j);
        end
        for j=i+1:F
            U(i,j) = (A(i,j) - L(i,1:j-1)*U(1:j-1,j))/L(i,i);
        end

    end
end