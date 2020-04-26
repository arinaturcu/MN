function B = PR_Inv(A)
    % Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt.
    % Se afla matricele Q si R cu ajutorul algoritmului Gram-Schmidt modificat
    % (descris in laboratorul 3). Daca A*A^(-1) = In si A = Q*R rezulta ca inversa
    % matricei A va fi egala cu solutia sistemului superior triunghuilar R*X = Q'.

    [m n] = size(A);
    Q = zeros(m, n);
    R = zeros(n);

    for i = 1:n
        R(i, i) = norm(A(:, i));
        Q(:, i) = A(:, i) / R(i, i);

        R(i, i + 1:n) = Q(:, i)' * A(:, i + 1:n);
        A(:, i + 1:n) = A(:, i + 1:n) - Q(:, i) * R(i, i + 1:n);

    endfor

    B = SST(R, Q');

endfunction
