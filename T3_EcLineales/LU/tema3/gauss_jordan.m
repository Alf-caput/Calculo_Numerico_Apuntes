function x = gauss_jordan(A,b)
    Ab=[A,b];
    [F, C]=size(Ab);
    for j=1:F
        Ab(j,j:C) = Ab(j,j:C)/Ab(j,j);
        if(j>1)
            for k=1:F
                if(k~=j)
                    Ab(k,j:C) = Ab(k,j:C)-Ab(k,j)*Ab(j,j:C);
                end
            end
        end
        for i=j+1:F
        % Falta hacer el if Ab(j,j) == 0, pivoteo 
            Ab(i,j:C)=Ab(i,j:C)-Ab(i,j)*Ab(j,j:C);
        end
    end
    x = Ab(:,C);
end