%%
%   Produces a Vandermonde matrix for polynomial interpolation.
%   
%   @param x a column vector of length n, representing the
%   x-coordinate of nodes to interpolate.
%

function V = vandermonde(x)
    n = length(x);
    V = ones(n);

    for j = 2 : n
        V(:, j) = V(:, j-1) .* x;   % Each column is x .^ n
    end
end
