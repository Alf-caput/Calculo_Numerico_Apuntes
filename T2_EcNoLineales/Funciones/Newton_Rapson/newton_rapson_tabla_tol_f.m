function c = newton_rapson_tabla_tol_f(f, df, a, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dado un punto a proximo a ella, y que muestra los resultados mediante
% una tabla.
% El algoritmo utilizado es el Metodo de Newton-Rapson.
% Inputs: 
% f = funcion anonima que devuelve un unico valor numerico [@()]
% df = funcion anonima que es derivada de f [@()]
% a = punto proximo a la raiz [num]
% err = error [float]
% Outputs:
% c = raiz aproximada
% El error se utilizara de forma que el algoritmo se detenga cuando la 
% imagen de la funcion sea menor que este.
% -----------------------------ALGORITMO-----------------------------------
    c = a - f(a)/df(a);
    fc = f(c);
    it = 0;
    err_it = abs(fc); % Error de la iteracion
    res = [it, a, c, fc, err_it];
    while(err_it > err && fc ~= 0)
        % El punto siguiente se calcula a partir del punto anterior
        a = c; % Para guardar en la tabla (no necesario sino se usa tabla)
        c = c - fc/df(c);
        fc = f(c);
        it = it + 1;
        err_it = abs(fc);
        % Añadimos al final de la matriz res los resultados.
        % Somos conscientes de que no es optimo redimensionar, pero
        % permitira mostrar de manera muy visual los resultados.
        res(end+1, :) = [it, a, c, fc, err_it];
    end
% -------------------------------------------------------------------------

% ------------------------------PRESENTACION-------------------------------
    % Operaciones para formatear a la precision del error
    if err < 1
        % Sacamos el numero de decimales de precision
        % Coincide con el |exp| de la notacion cientifica del error + 1 
        % Y guardamos el formato para los datos de la tabla output
        f_precision = abs(floor(log10(err)));
        f_precision = strcat('%.', num2str(f_precision+1), 'f');
    else
        f_precision = strcat('%f');
    end
    % Tabla con los valores de cada iteracion formateados
    tabla_resultados = table( ...
        res(:, 1), ... % numero de iteracion
        num2str(res(:, 2), f_precision), ... % punto proximo a la raiz
        num2str(res(:, 3), f_precision), ... % punto siguiente
        num2str(res(:, 4), f_precision), ... % imagen punto siguiente
        num2str(res(:, 5), f_precision), ... % error de la iteracion
        VariableNames={'It', 'xi', 'xi+1', 'f(c)', 'Error'});
    disp(tabla_resultados)
% -------------------------------------------------------------------------
end