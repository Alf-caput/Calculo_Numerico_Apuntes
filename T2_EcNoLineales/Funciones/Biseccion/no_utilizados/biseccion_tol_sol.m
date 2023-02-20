function c = biseccion_tol_sol(f, a, b, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dado un intervalo (a, b) que la contenga.
% El algoritmo utilizado es el metodo de la biseccion.
% Inputs: 
% f = funcion anonima que devuelve un unico valor numerico [@()]
% a, b = extremos del intervalo donde se encuentre la solucion [num]
% err = error [float]
% Outputs:
% c = raiz aproximada
% El error se utilizara de forma que el algoritmo se detenga cuando la 
% mitad del intervalo sea menor que este.
    % Comprobamos que el intervalo dado contiene una raiz
    if f(a)*f(b) < 0
        % Inicializacion de variables
        c = (a+b) / 2;
        it = 0;
        fc = f(c);
        % Mientras que las imagenes sean mayores que el error y la funcion
        % no encuentre la raiz exacta se realiza el bucle del algoritmo
        while(abs((b-a)/2) > err && fc ~= 0)
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
        end
    else
        disp("Este intervalo no contiene raices.")
    end
end