function x = gauss_simple(A,b)
    Ab=[A,b];
    [F, C]=size(Ab);
    for j=1:F-1
        for i=j+1:F
        % Falta hacer el if Ab(j,j) == 0, pivoteo parcial 
        % intercambiar filas segun sea el mayor valor absoluto del pivote
            Ab(i,j:C)=Ab(i,j:C)-Ab(i,j)/Ab(j,j)*Ab(j,j:C);
        end
    end
    x = zeros(F,1);
    x(F) = Ab(F,C)/Ab(F,F);
    for i=F-1:-1:1
        x(i)=(Ab(i,C)-Ab(i,i+1:F)*x(i+1:F))/Ab(i,i);
    end
end