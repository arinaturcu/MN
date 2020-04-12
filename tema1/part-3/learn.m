function [w] = learn(X, y)
    [n m] = size(X);
    X(:, m + 1) = 1;
    [Q R] = Householder(X);
    y1 = Q' * y;
    w = SST(R, y1);
end
