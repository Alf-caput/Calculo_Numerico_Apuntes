function x = sust_adelante(Ub)
    [f, c] = size(Ub);
    x = zeros(f, 1);
    % Despejamos la primera componente de la solución
    x(1) = Ub(1, 1) / Ub(1, c);
    for i = 2: f
        % Se realiza sustitución hacia delante
        x(i)= (Ub(i, c) - Ub(i, 1:i-1)*x(1:i-1)) / Ub(i, i);
    end
end