function c = biseccion_tabla_tol_sol(f, a, b, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dado un intervalo (a, b) que la contenga, y que muestra los resultados 
% mediante una tabla.
% El algoritmo utilizado es el Metodo de la biseccion.
% Inputs: 
% f = funcion anonima que devuelve un unico valor numerico [@()]
% a, b = extremos del intervalo donde se encuentre la solucion [num]
% err = error [float]
% Outputs:
% c = raiz aproximada [float]
% El error se utilizara de forma que el algoritmo se detenga cuando la 
% mitad del intervalo de busqueda sea menor que este.
% -----------------------------ALGORITMO-----------------------------------
    % Comprobamos que el intervalo dado contiene una raiz
    if f(a)*f(b) < 0  
        % Inicializacion de variables
        c = (a+b) / 2;
        it = 0;
        fc = f(c);
        err_it = abs((b-a)/2); % Error de la iteracion
        % Matriz con la iteracion 0 (almacenara valores de las iteraciones)
        res = [it, a, b, c, fc, err_it]; 
        while err_it > err && fc ~= 0
            % Si el producto de imagenes da negativo intercambiaremos el
            % extremo del intervalo que corresponda con el punto medio
            % convergiendo a la raiz al reducir el rango de busqueda.
            if f(a) * fc < 0
                b = c;
            else
                a = c;
            end
            c = (a+b) / 2;
            fc = f(c);
            it = it + 1;
            err_it = abs((b-a)/2);
            % Añadimos al final de la matriz res los resultados.
            % Somos conscientes de que no es optimo redimensionar,
            % permitira mostrar de manera muy visual los resultados.
            res(end+1, :) = [it, a, b, c, fc, err_it]; 
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
            num2str(res(:, 2), f_precision), ... % extremo inferior
            num2str(res(:, 3), f_precision), ... % extremo superior
            num2str(res(:, 4), f_precision), ... % punto medio
            num2str(res(:, 5), f_precision), ... % imagen punto medio
            num2str(res(:, 6), f_precision), ... % error de la iteracion
            VariableNames={'It', 'a', 'b', 'c', 'f(c)', 'Error'});
        disp(tabla_resultados)
% -------------------------------------------------------------------------
    else
        disp("Este intervalo no contiene raices.")
    end
end