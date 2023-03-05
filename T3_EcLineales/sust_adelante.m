function x = sust_adelante(Lb)
    [f, c] = size(Lb);
    x = zeros(f, 1);
    % Despejamos la primera componente de la solución
    x(1) = Lb(1, c) / Lb(1, 1);
    for i = 2: f
        % Se realiza sustitución hacia delante
        x(i)= (Lb(i, c) - Lb(i, 1:i-1)*x(1:i-1)) / Lb(i, i);
    end
end