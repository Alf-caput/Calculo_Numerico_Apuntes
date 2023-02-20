function c = biseccion_tabla(f, a, b, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dado un intervalo (a, b) que la contenga.
% El algoritmo utilizado es el metodo de la biseccion.
% Inputs: 
% f = funcion anonima que devuelve un unico valor numerico [@()]
% a, b = extremos del intervalo donde se encuentre la solucion [num]
% err = error [float]
% Outputs:
% c = raiz aproximada
% Se imprimira por pantalla los resultados de cada iteracion en una tabla.
% El error se utilizara de forma que el algoritmo se detenga cuando las 
% imagenes de la funcion sean menores que este.

% ---------------------------ALGORITMO-------------------------------------
    % Comprobamos que el intervalo dado contiene una raiz
    if f(a)*f(b) < 0  
        % Inicializacion de variables
        c = (a+b) / 2;
        % Elementos del algoritmo
        [lb, ub, xc, fc] = deal(a, b, c, f(c)); % AsignacionMultiple (deal)
        it = 0;
        % Mientras que las imagenes sean mayores que el error y la funcion
        % no encuentre la raiz exacta se realiza el bucle del algoritmo
        while(abs(f(c)) > err && f(c) ~= 0)
            c = (a+b) / 2;
            % Si el producto de imagenes da negativo por bolzano hay una
            % raiz (asumimos funcion continua) y por tanto intercambiaremos 
            % el extremo del intervalo que corresponda con el punto medio 
            % convergiendo a la raiz al reducir el rango de busqueda.
            if f(a) * f(c) < 0
                b = c;
            else
                a = c;
            end
            it = it + 1;
            % Para posteriormente mostrar en una tabla guardamos:
            % lb = extremos inferiores del intervalo (lower bound)
            % ub = extremos superiores del intervalo (upper bound)
            % xc = punto medio de los intervalos sucesivos
            % fc = imagen del punto medio
            [lb, ub, xc, fc] = deal([lb; a], [ub; b], [xc; c], [fc; f(c)]);
        end
        % Guardamos en un array columna el numero de iteraciones
        its = (0: it)';
% -------------------------------------------------------------------------       

% ------------------------------PRESENTACION-------------------------------
        if err < 1
            % Sacamos el numero de decimales de precision
            % Coincide con el |exp| de la notacion cientifica del error + 1 
            % Y guardamos el formato para los datos de la tabla output
            f_precision = abs(floor(log10(err)));
            f_precision = strcat('%.', num2str(f_precision+1), 'f');
        else
            f_precision = strcat('%f');
        end

        % Guardamos en una tabla los resultados obtenidos anteriormente
        results_table = table( ...
            its, num2str(lb, f_precision), num2str(ub, f_precision), ...
            num2str(xc, f_precision), num2str(fc, f_precision), ...
            VariableNames={ ...
            'Iteration', 'LowerBound', 'UpperBound', 'c', 'f(c)'});
        % Mostramos la tabla
        disp(results_table)
% -------------------------------------------------------------------------
    else
        disp("Este intervalo no contiene raices.")
    end
end