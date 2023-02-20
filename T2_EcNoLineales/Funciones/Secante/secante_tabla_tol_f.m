function c = secante_tabla_tol_f(f, a, b, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dados dos puntos proximos a ella.
% El algoritmo utilizado es el Metodo de la secante.
% Inputs: 
% f = funcion anonima que devuelve un unico valor numerico [@()]
% a = punto 1 proximo a la raiz [num]
% b = punto 2 proximo a la raiz [num]
% err = error [float]
% Outputs:
% c = raiz aproximada
% El error se utilizara de forma que el algoritmo se detenga cuando la 
% imagen de la funcion sea menor que este.
% -----------------------------ALGORITMO-----------------------------------
    fa = f(a);
    fb = f(b);
    c = a - fa*(b-a) / (fb - fa);
    fc = f(c);
    it = 0;
    err_it = abs(fc); % Error de la iteracion
    res = [it, b, a, c, fc, err_it];
    while(err_it > err && fc ~= 0)
        aux = c; % guardamos en aux el valor de c
        c = c - fc*(a-c) / (fa - fc); % c pasa a ser el punto siguiente
        fa = fc; 
        fc = f(c);
        it = it + 1;
        err_it = abs(fc);
        % Añadimos al final de la matriz res los resultados.
        % Somos conscientes de que no es optimo redimensionar, pero
        % permitira mostrar de manera muy visual los resultados.
        res(end+1, :) = [it, a, aux, c, fc, err_it];
        a = aux; % a se convierte en el punto anterior 
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
        num2str(res(:, 2), f_precision), ... % punto proximo a la raiz xi-1
        num2str(res(:, 3), f_precision), ... % punto proximo a la raiz xi
        num2str(res(:, 4), f_precision), ... % punto siguiente xi+1
        num2str(res(:, 5), f_precision), ... % imagen punto siguiente
        num2str(res(:, 6), f_precision), ... % error de la iteracion
        VariableNames={'It', 'xi-1', 'xi', 'xi+1', 'f(c)', 'Error'});
    disp(tabla_resultados)
% -------------------------------------------------------------------------
end