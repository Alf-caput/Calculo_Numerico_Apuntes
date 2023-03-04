function Ab = gauss_simple(A, b)
    Ab = [A, b];
    [f, c] = size(Ab);
    for j = 1: min(f, c) % El número de pivotes es la menor de las dimensiones
        for i = j + 1: f
            Ab(i, :) = Ab(i, :) -  Ab(i, j) / Ab(j, j) * Ab(j, :);
        end
    end
end