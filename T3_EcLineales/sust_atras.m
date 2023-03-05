function x = sust_atras(Lb)
    [f, c] = size(Lb);
    x = zeros(f, 1);
    % Despejamos la última componente de la solución
    x(f) = Lb(f, c) / Lb(f, f);
    for i = f-1:-1:1
        % Se realiza sustitución hacia atrás
        x(i)= (Lb(i, c) - Lb(i, i+1:f)*x(i+1:f)) / Lb(i, i);
    end
end