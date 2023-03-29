%%
% Implements the LDL Gauss factorisation for symmetrical matrices.
%
% To generate a symmetric matrix: A = rand(5); A = tril(A, -1) + tril(A)'

function [L, D] = my_ldl(A)
    if(issymmetric(A) == false)
        error("The matrix A is not symmetrical");
    end

    n = length(A);
    p = zeros(n);

    L = eye(n);
    D = zeros(n, 1);

    for j = 1 : n
        p(j, 1 : j-1) = L(j, 1:j-1) .* D(1:j-1)';

        D(j) = A(j, j) - L(j, 1 : j-1) * p(j, 1:j-1)';

        for i = j+1 : n
            L(i, j) = (A(i, j) - L(i, 1:j-1) * p(j, 1:j-1)') / D(j);
        end
    end

    D = diag(D);
end