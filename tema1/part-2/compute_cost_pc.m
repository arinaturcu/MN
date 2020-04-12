function [cost] = compute_cost_pc(points, centroids)
    [N D] = size(points);
    [NC ND] = size(centroids);
    cost = 0;

    for i = 1:NC
        centr = centroids(i, :);

        for j = 1:N
            p = points(j, :);
            d = distance(centr, p);

            if d == min(distance(centroids, p))
                cost = cost + d;
            endif

        endfor

    endfor

endfunction
