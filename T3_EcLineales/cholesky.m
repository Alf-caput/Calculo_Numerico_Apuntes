function G = cholesky(A)
% blablabla
    [f, c] = size(A);
    G = zeros(f, c);
    for i=1: f
        G(i, i) = sqrt(A(i, i) - G(i, :)*G(i, :)');
        for j=i+1: f
            G(j, i) = (A(j, i) - G(i,:)*G(j ,:)')/G(i, i);
        end
    end
end