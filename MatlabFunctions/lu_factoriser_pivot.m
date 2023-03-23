% Gauss with pivoting for LU factorisation.
% The overall complexity shouldn't change in respect to the classic algo.
%
% To check the solution test L*U against P*A.

function [L, U, P] = lu_factoriser_pivot(A)
    n = length(A);
    P = eye(n);

    for k = 1 : n-1
        % Index of the new pivoting row
        [~, r] = max(abs(A(k:n, k)));   % ~ ignores the return value
        r = r + k - 1;

        if(abs(A(r, r)) < eps)
            error("Can't factorise");
        end

        % Generate permutation matrix
        p = eye(n);
        p(k, k) = 0;
        p(k, r) = 1;
        p(r, r) = 0;
        p(r, k) = 1;

        A = p * A;

        P = p * P;

        % Perform usual computations

        A(k+1:n, k) = A(k+1:n, k) / A(k, k);
        A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
    end

    L = tril(A, -1) + eye(n);
    U = triu(A);
end
