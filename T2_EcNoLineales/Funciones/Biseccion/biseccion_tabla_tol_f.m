function [xs, i] = biseccion_tabla_tol_f(y, a, b, ermax)
% Función que permite calcular de manera aproximada una raíz de una función 
% dado un intervalo (a, b) que la contenga, y que muestra en una tabla los
% valores de cada iteración.
% El algoritmo utilizado es el Método de la bisección.
% Inputs: 
% y = función en forma anónima
% a = extremo menor del intervalo
% b = extremo mayor del intervalo
% ermax = error máximo admitido 
% Outputs:
% xs = raíz calculada
% i = número de iteraciones
% El error se calculará como el valor absoluto de la imagen de la raíz 
% aproximada.
% -----------------------------ALGORITMO-----------------------------------
    % Comprobamos que el intervalo dado contiene una raiz
    if y(a)*y(b) < 0  
        % Inicialización de variables
        xs = (a+b) / 2;
        i = 1;
        ys = y(xs);
        err_it = abs(ys); % Error de la iteracion
        % Matriz con la iteración 1 (almacenará valores de las iteraciones)
        res = [i, a, b, xs, ys, err_it];
        while err_it > ermax && ys ~= 0
            % Si el producto de imagenes da negativo intercambiaremos el
            % extremo del intervalo que corresponda con el punto medio
            % convergiendo a la raíz al reducir el rango de busqueda
            if y(a) * ys < 0
                b = xs;
            else
                a = xs;
            end
            xs = (a+b) / 2;
            ys = y(xs);
            i = i + 1;
            err_it = abs(ys);
            % Añadimos al final de la matriz res los resultados
            % Somos conscientes de que no es óptimo redimensionar 
            % Pero permitirá mostrar de manera muy visual los resultados
            res(end+1, :) = [i, a, b, xs, ys, err_it]; 
        end       
% ------------------------------PRESENTACIÓN-------------------------------
        % Operaciones para formatear a la precisión del error
        if err_it < 1
            % Sacamos el número de decimales de precisión
            % Coincide con el |exp| de la notación científica del error + 1 
            % Y guardamos el formato para los datos de la tabla output
            f_precision = abs(floor(log10(ermax)));
            f_precision = strcat('%.', num2str(f_precision+1), 'f');
        else
            f_precision = strcat('%f');
        end
        % Tabla con los valores de cada iteración formateados
        tabla_resultados = table( ...
            res(:, 1), ... % número de iteración
            num2str(res(:, 2), f_precision), ... % extremo inferior
            num2str(res(:, 3), f_precision), ... % extremo superior
            num2str(res(:, 4), f_precision), ... % punto medio
            num2str(res(:, 5), f_precision), ... % imagen punto medio
            num2str(res(:, 6), f_precision), ... % error de la iteración
            VariableNames={'It', 'a', 'b', 'xs', 'f(xs)', 'Error'});
        disp(tabla_resultados)
% -------------------------------------------------------------------------
    else
        disp("Este intervalo no contiene raices.")
    end
end