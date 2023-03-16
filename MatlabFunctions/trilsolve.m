%%
% Resolve a linear system in upper triangular form

function x = trilsolve(A, b)
    if(istril(A) == false)
        error("A is not an upper triangular matrix");
    end

    n = length(A);
    x = zeros(n, 1);
    for i = 1 : n
        x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1)) / A(i, i);
    end
end