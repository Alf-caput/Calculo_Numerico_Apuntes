function [r, i] = biseccion(y, a, b, ermax)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dado un intervalo (a, b) que la contenga, y que muestra los resultados 
% mediante una tabla.
% El algoritmo utilizado es el Metodo de la biseccion.
% Inputs: 
% y = función en forma anónima ( y = @(x) )
% b = extremo mayor del intervalo
% ermax = error maximo admitido 
% Outputs:
% xs = raiz calculada
% i = número de iteraciones 
% El error se utilizara de forma que el algoritmo se detenga cuando la 
% mitad del ancho del intervalo de busqueda sea menor que este.
    % Comprobamos que el intervalo dado contiene una raiz
    if y(a)*y(b) < 0
        % Inicializacion de variables
        r = (a+b) / 2;
        i = 1;
        yr = y(r);
        err_it = abs((b-a)/2); % Error de la iteracion
        while(err_it > ermax && yr ~= 0)
            % Si el producto de imagenes da negativo intercambiaremos el
            % extremo del intervalo que corresponda con el punto medio
            % convergiendo a la raiz al reducir el rango de busqueda.
            if y(a) * yr < 0
                b = r;
            else
                a = r;
            end
            r = (a+b) / 2;
            yr = y(r);
            i = i + 1;
            err_it = abs((b-a)/2);
        end
    else
        disp("Este intervalo no contiene raices.")
    end
end