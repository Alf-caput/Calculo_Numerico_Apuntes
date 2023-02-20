function c = biseccion_tabla_tol_f(f, a, b, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dado un intervalo (a, b) que la contenga.
% El algoritmo utilizado es el metodo de la biseccion.
% Inputs: 
% f = funcion anonima que devuelve un unico valor numerico [@()]
% a, b = extremos del intervalo donde se encuentre la solucion [num]
% err = error [float]
% Outputs:
% c = raiz aproximada [float]
% Se imprimira por pantalla los resultados de cada iteracion en una tabla.
% El error se utilizara de forma que el algoritmo se detenga cuando las 
% imagenes de la funcion sean menores que este.

% -----------------------------ALGORITMO-----------------------------------
    % Comprobamos que el intervalo dado contiene una raiz
    if f(a)*f(b) < 0  
        % Inicializacion de variables
        c = (a+b) / 2;
        it = 0;
        fc = f(c);
        result = table( ...
            it, a, b, c, fc, ...
            VariableNames={ ...
            'Iteration', 'LowerBound', 'UpperBound', 'c', 'f(c)'});
        % Mientras que las imagenes sean mayores que el error y la funcion
        % no encuentre la raiz exacta se realiza el bucle del algoritmo
        while(abs(fc) > err && fc ~= 0)
            % Si el producto de imagenes da negativo por bolzano hay una
            % raiz (asumimos funcion continua) y por tanto intercambiaremos 
            % el extremo del intervalo que corresponda con el punto medio 
            % convergiendo a la raiz al reducir el rango de busqueda.
            if f(a) * fc < 0
                b = c;
            else
                a = c;
            end
            c = (a+b) / 2;
            fc = f(c);
            it = it + 1;
            % Añadimos a la tabla los resultados
            % Somos conscientes de que no es optimo redimensionar, pero
            % permitira mostrar de manera muy visual los resultados.
            result = [result;
                table( ...
                it, a, b, c, fc, ...
                VariableNames={ ...
                'Iteration', 'LowerBound', 'UpperBound', 'c', 'f(c)'})];
        end
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
        % Con varfun() aplicamos el formato de la precision
        aux = varfun(@(x) num2str(x, f_precision), result, ...
            InputVariables={'LowerBound', 'UpperBound', 'c', 'f(c)'});
        % Renombramos con los nombres originales (sino sale el prefijo Var)
        aux.Properties.VariableNames=result.Properties.VariableNames(2:end);
        result = [result(:, 1), aux];
        disp(result)

% -------------------------------------------------------------------------
    else
        disp("Este intervalo no contiene raices.")
    end
end