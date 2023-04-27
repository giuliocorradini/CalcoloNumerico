function [x,y] = bisection(a,b,f,tau)
    N = floor( log2(b-a) / tau ) + 1;
    fa = feval(f, a);
    fb = feval(f, b);

    for k = 1 : N
        c = a + (b-a) / 2;
        fc = feval(f, c);

        if fc == 0
            break;
        end

        if fa * fc < 0
            b = c;
        else
            a = c;
        end
    end

    x = c;
    y = fc;
end
