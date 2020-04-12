function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
    [X y_real] = preprocess(path_to_testset, histogram, count_bins);

    [n m] = size(X);
    X(:, m + 1) = 1;

    y = X * w;
    [dim d] = size(y);

    expected = (y_real >= 0);
    real = (y >= 0);

    correct = sum(expected - real == 0);

    percentage = correct / dim;

endfunction
