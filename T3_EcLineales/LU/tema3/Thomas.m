function x = Thomas(C)
    [F, F] = size(C);
    D = diag(C);
    for i=1:F
        D(i) = C(i,i);
        A(i) = C(i,i+1);
        B(i) = C(i,i-1);
        
end