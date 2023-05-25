function [alpha] = polynomial_regression(x, y, n, check)

    m = length(x);

    if m < n
        error "Inadequate dimensions. x size must be less than n";
    end

    A = ones(m, n);
    for i = 2 : n
        A(:,i) = A(:,i-1) .* x;
    end

    if nargin == 4 && check && rank(A) < n
        error "Linear dependent columns. Degenerate case.";
    end

    [Q, R] = qr(A);
    Rsig = R(1:n, 1:n);

    ysig = Q' * y;
    ysig = ysig(1:n);

    alpha = Rsig \ ysig;
    alpha = flip(alpha);

end