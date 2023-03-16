%%
% Solves a linear sistem in diagonal form
%
% To test this function you may generate a random
% diagonal matrix with D = rand(n), then D = diag(diag(D))

function x = diagosolve(D, b)
    if (isdiag(D) == false)
        error("D is not diagonal");
    end
    
    x = b ./ diag(D);
end
