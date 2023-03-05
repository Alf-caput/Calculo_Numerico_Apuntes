function x = sust_atras(Ub)
    [f, c] = size(Ub);
    x = zeros(f, 1);
    % Despejamos la última componente de la solución
    x(f) = Ub(f, c) / Ub(f, f);
    for i = f-1:-1:1
        % Se realiza sustitución hacia atrás
        x(i)= (Ub(i, c) - Ub(i, i+1:f)*x(i+1:f)) / Ub(i, i);
    end
end