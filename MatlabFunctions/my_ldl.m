%%
% Implements the LDL Gauss factorisation for symmetrical matrices.
%
% To generate a symmetric matrix: A = rand(5); A = triu(A) + tril(triu(A)', 1)

function [L, D] = my_ldl(A)
    if(issymmetric(A) == false)
        error("The matrix A is not symmetrical");
    end

    n = length(A);
    p = zeros(1, n - 1);

    L = eye(n);
    D = zeros(n, n);

    for j = 1 : n
        dia = diag(D);
        p = L(j, 1) * dia(1:j-1)';

        D(j, j) = A(j, j) - L(j, 1 : j-1) * p(1, 1:j-1)';

        for i = j+1 : n
            L(i, j) = (A(i, j) - L(i, 1:j-1) * p(1, 1:j-1)') / D(j, j);
        end
    end

end