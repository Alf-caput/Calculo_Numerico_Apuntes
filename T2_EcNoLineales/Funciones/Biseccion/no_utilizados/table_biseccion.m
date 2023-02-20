function c = table_biseccion(f, a, b, err)

    if f(a)*f(b) < 0  % Comprobamos que el intervalo dado contiene una raiz
        c = (a+b) / 2;
        it = 0;
        results_table = table( ...
            it, a, b, ...
            c, f(c), ...
            VariableNames={ ...
            'Iteration', 'LowerBound', 'UpperBound', 'c', 'f(c)'});
        
        while(abs(f(c)) > err && f(c) ~= 0)
            c = (a+b) / 2;
            if f(a) * f(c) < 0
                b = c;
            else
                a = c;
            end
            it = it + 1;
            results_table = [results_table;
                table(it, a, b, c, f(c), ...
                VariableNames={ ...
                'Iteration', 'LowerBound','UpperBound', 'c', 'f(c)'});];
        end
        f_precision = (num2str(err, "%e"));
        f_precision = str2double(f_precision(end));
        f_precision = strcat('%.', num2str(f_precision), 'f');

        aux=results_table.Properties.VariableNames;
        results_table = varfun(@(x) num2str(x, f_precision), ...
            results_table, ...
            InputVariables={'LowerBound','UpperBound', 'c', 'f(c)'});
        
        disp(results_table)
    else
        disp("Este intervalo no contiene raíces")
    end
end