function [G, X] = cholesky(A, b)
    [F, F] = size(A);
    Ab=[A,b];
    G = zeros(F);
    for i = 1:F 
        G(i, i) = sqrt(A(i, i) - (G(1:(i-1),i))' * G(1:(i-1),i));
        for j = i+1:F
            G(j, i) =(A(i, j) - (G(1:(i-1),i))' * G(1:(i-1),j))*  1 / A(i,i);
        end
    end
    X = gauss_simple(G',b);
end