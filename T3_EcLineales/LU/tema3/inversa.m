function [A_1] = inversa(A)
    [F, F] = size(A);
    B = eye(F);
    A_1 = zeros(F);
    d = eig(A);
    if A == traspose(A) && all(d>0)
        disp("La matriz es simetrica positiva")
        for i=1:F
            [G, A_1(i,:)] = cholesky(A,B(i,:));
        end
    else
        disp("La matriz no es simetrica positiva")
        for i=1:F
            [L U] = descomposicion_LU(A,B(i,:));
            y = L*B(i,:);
            A_1(i,:) = gauss_jordan(L,y);
        end
    end
end