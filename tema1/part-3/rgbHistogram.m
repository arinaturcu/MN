function [sol] = rgbHistogram(paths_to_images, count_bins)
    M = imread(paths_to_images);
    R = M(:, :, 1);
    G = M(:, :, 2);
    B = M(:, :, 3);

    [n, m] = size(R);

    R = reshape(R, 1, n * m);
    G = reshape(G, 1, n * m);
    B = reshape(B, 1, n * m);

    [his_R, ind] = histc(R, 0:255);
    [his_G, ind] = histc(G, 0:255);
    [his_B, ind] = histc(B, 0:255);

    subs = floor([1:256] * count_bins / 256) + 1;
    subs(256) = [];
    aux = 1;
    subs = cat(2, aux, subs);

    sol_R = accumarray(subs', his_R)';
    sol_G = accumarray(subs', his_G)';
    sol_B = accumarray(subs', his_B)';

    sol = cat(2, sol_R, sol_G, sol_B);
end
