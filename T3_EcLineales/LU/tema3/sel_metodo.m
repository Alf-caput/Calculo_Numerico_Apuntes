function [] = sel_metodo(A,b)
    if A == A' & all(eig(A))> 0
        disp("La matriz es simetrica positiva")
        cholesky(A,b)
    else
        disp("La matriz no es simetrica positiva")
        descomposicion_LU(A,b)
    end

end