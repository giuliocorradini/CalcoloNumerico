% Performs the Gauss LU factorisation on the matrix A.
% Returns the matrices L and U, such that LU = A.
%
% This functions returns two matrices, to capture both you have to use
% this notation [x,y] = lu_factoriser(A)

function [L, U] = lu_factoriser(A)

    n = length(A);

    for k = 1 : n-1
        if(abs(A(k, k)) < eps)   % This condition tests for A(k,k)==0
                                 % eps is the machine precision
            error("Can't factorise");
        end

        A(k+1:n, k) = A(k+1:n, k) / A(k, k);
        A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
                                            %moltiplicatori
                                                        %elementi restanti
                                                        %della riga k-esima
    end

    L = tril(A, -1) + eye(n);
    U = triu(A);
end
