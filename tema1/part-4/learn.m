function [w] = learn(X, y, lr, epochs)
    batch_size = 64;
    [n m] = size(X);
    X(:, m + 1) = 1;

    X = (X - mean(X)) ./ std(X);
    X(:, m + 1) = 1;

    w = -0.1 + 0.2 * rand(m + 1, 1);

    for epoch = 1:epochs
        k = randperm(n);
        X_b = X(k(1:batch_size), :);
        y_b = y(k(1:batch_size), 1);

        w = w - lr * (1 / n) * ((X_b * w - y_b)' * X_b)';
    endfor

endfunction
