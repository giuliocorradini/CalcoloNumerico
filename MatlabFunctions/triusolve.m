%%
%   Solves a linear system in upper triangular form
%   Backwards substituion

function x = triusolve(A, b)
    if (istriu(A) == false)
        error("The coefficient matrix isn't a upper triangular");
    end

    n = length(A);
    x = zeros(n, 1);

    for i = n : -1 : 1
        x(i) = (b(i) - A(i, i+1:end) * x(i+1:n)) / A(i, i);
    end
end
