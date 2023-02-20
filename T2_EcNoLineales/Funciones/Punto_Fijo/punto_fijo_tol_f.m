function c = punto_fijo_tol_f(f, g, a, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dado un punto proximo a ella, y que muestra los resultados mediante
% una tabla.
% El algoritmo utilizado es el Metodo del punto fijo.
% Inputs:
% f = funcion anonima que devuelve un unico valor numerico [@()]
% g = funcion anonima de iteracion que "    "   "   "    " [@()]
% a = punto proximo al punto fijo
% err = error [float]
% Outputs:
% c = raiz aproximada
% El error se utilizara de forma que el algoritmo se detenga cuando la 
% imagen de la funcion sea menor que este.
    c = g(a);
    fc = f(c);
    it = 0;
    err_it = abs(fc); % Error de la iteracion
    while(err_it > err && fc ~= 0)
        % El punto siguiente se calcula a partir del punto anterior
        % evaluando la funcion de iteracion.
        c = g(c);
        fc = f(c);
        it = it + 1;
        err_it = abs(fc);
    end
end