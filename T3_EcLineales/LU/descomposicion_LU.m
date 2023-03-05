function [L,U] = descomposicion_LU(A)
    [F, F]=size(A);
    L = eye(F);
    U = eye(F);
    for k=1:F
        % Diagonal de U compuesta por unos
        U(k,k) = 1;
        % Primera columa de L es igual a la primera columna de A
        L(k,1) = A(k,1);
        % Primera fila de U es igual a A(1,:) / L(1,1)
        U(1,k) = A(1,k)/L(1,1);
        for i=k:F
            L(i,k)   = A(k,i) - L(k,1:(k-1))*U(1:(k-1),i);
        end
        for i=k+1:F
            U(k,i) = (A(i,k) - L(i,1:(k-1))*U(1:(k-1),k))/L(k,k);
        end

    end
end