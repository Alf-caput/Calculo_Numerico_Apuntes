function c = regula_falsi_tol_f(f, a, b, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dado un intervalo (a, b) que la contenga.
% El algoritmo utilizado es el Metodo de la regla falsa (regula falsi).
% Inputs: 
% f = funcion anonima que devuelve un unico valor numerico [@()]
% a, b = extremos del intervalo donde se encuentre la solucion [num]
% err = error [float]
% Outputs:
% c = raiz aproximada
% El error se utilizara de forma que el algoritmo se detenga cuando la 
% imagen de la funcion sea menor que este.
    fa = f(a);
    fb = f(b);
    % Comprobamos que el intervalo dado contiene una raiz
    if fa * fb < 0
        % Se calcula el punto de corte con el eje X de la recta que une las
        % imagenes de f(a) y f(b).
        c = b + fb*(a-b) / (fb-fa);
        fc = f(c);
        it = 0;
        err_it = abs(fc); % Error de la iteracion
        while(err_it > err && fc ~= 0)
            % Si el producto de imagenes da negativo intercambiaremos el
            % extremo del intervalo que corresponda con el punto de corte
            % de la recta anterior convergiendo a la raiz al reducir el
            % rango de busqueda.
            if fa * fc < 0
                b = c;
                fb = fc;
            else
                a = c;
                fa = fc;
            end
            c = b + fb*(a-b) / (fb-fa);
            fc = f(c);
            it = it + 1;
            err_it = abs(fc);
        end
    else
        disp("Este intervalo no contiene raices.")
    end
end