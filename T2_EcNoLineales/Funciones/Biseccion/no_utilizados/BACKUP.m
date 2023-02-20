function c = biseccion_tabla(f, a, b, err)
%
    if f(a)*f(b) < 0  % Comprobamos que el intervalo dado contiene una raiz
        c = (a+b) / 2;
        [lb, ub, xc, fc] = deal(a, b, c, f(c));
        it = 0;
        while(abs(f(c)) > err && f(c) ~= 0)
            c = (a+b) / 2;
            if f(a) * f(c) < 0
                b = c;
            else
                a = c;
            end
            it = it + 1;
            [lb, ub, xc, fc] = deal([lb; a], [ub; b], [xc; c], [fc; f(c)]);
        end
        its = (0: it)';
        f_precision = (num2str(err, "%e"));
        f_precision = str2double(f_precision(end));
        f_precision = strcat('%.', num2str(f_precision), 'f');
        results_table = table( ...
            its, num2str(lb, f_precision), num2str(ub, f_precision), ...
            num2str(xc, f_precision), num2str(fc, f_precision), ...
            VariableNames={'Iteration', 'LowerBound', 'UpperBound', 'c', 'f(c)'});

        disp(results_table)
    else
        disp("Este intervalo no contiene raíces")
    end
end