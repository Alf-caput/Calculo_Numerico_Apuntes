function [x, k] = gauss_seidel(A,b,ermax)
 
    [F, F] = size(A);
    sum = 0;
    k = 1;
    % Paso 1: compruebo si la matriz es diagonalmente dominante
    for i = 1:F
        for j=1:F
            if i ~= j
                sum = sum + A(i,j);
            end
        end
        if abs(sum) > abs(A(i,i))
            disp("La matriz no es diagonalmente dominante");
            return
        end
        sum = 0;
    end
    
    % Paso 2: asumo un vector solucion
    x = zeros(F,1);
    P = zeros(F,1);
    y = x + 1;
    % Paso 3: itero hasta que el error sea menor que ermax
    while abs(y-x) > ermax
        y = x;
        for i=1:F
            x(i) = (1/A(i,i))*(b(i) - A(i,[1:i-1,i+1:F])*x([1:i-1,i+1:F]));
        end
        k = k + 1;
        fprintf("Iteracion numero %d",k);
        x
    end

end