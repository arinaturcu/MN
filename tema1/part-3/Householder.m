function [Q R] = Householder(A)
    [m n] = size(A);
    H = eye(m);

    for p = 1:min(m - 1, n)
        sigma = sign(A(p, p)) * norm(A(p:m, p));

        vp(1:p - 1, 1) = 0;
        vp(p, 1) = A(p, p) + sigma;
        vp(p + 1:m, 1) = A(p + 1:m, p);

        Hp = eye(m) - (2 / (vp' * vp)) * (vp * vp');

        # calculez A = Hp * A
        beta = sigma * vp(p);
        A(p, p) = -sigma;
        A(p + 1:m, p) = 0;

        for j = p + 1:n
            tau = vp(p:m)' * A(p:m, j) / beta;
            A(p:m, j) = A(p:m, j) - tau * vp(p:m);
        endfor

        H = Hp * H;
    endfor

    Q = H';
    R = A;

endfunction
