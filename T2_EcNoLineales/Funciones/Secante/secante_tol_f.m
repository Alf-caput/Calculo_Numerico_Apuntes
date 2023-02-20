function c = secante_tol_f(f, a, b, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dados dos puntos proximos a ella.
% El algoritmo utilizado es el Metodo de la secante.
% Inputs: 
% f = funcion anonima que devuelve un unico valor numerico [@()]
% a, b = puntos proximos a la raiz [num]
% err = error [float]
% Outputs:
% c = raiz aproximada
% El error se utilizara de forma que el algoritmo se detenga cuando la 
% imagen de la funcion sea menor que este.
    fa = f(a);
    fb = f(b);
    c = a - fa*(b-a) / (fb - fa);
    fc = f(c);
    it = 0;
    err_it = abs(fc); % Error de la iteracion
    while(err_it > err && fc ~= 0)
        aux = c; % guardamos en aux el valor de c
        c = c - fc*(a-c) / (fa - fc);% c pasa a ser el punto siguiente
        a = aux; % a se convierte en el punto anterior 
        fa = fc;
        fc = f(c);
        it = it + 1;
        err_it = abs(fc);
    end
end