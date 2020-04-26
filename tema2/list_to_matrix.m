function [mat, N, val1, val2] = list_to_matrix(fid)
    N = str2num(fgetl(fid));
    mat = zeros(N);

    for i = 1:N
        line = str2num(fgetl(fid));

        for j = 3:line(2) + 2
            mat(line(1), line(j)) = 1;
        endfor

    endfor

    mat(1:N + 1:N * N) = 0; % 0 pe diagonala

    val1 = str2num(fgetl(fid));
    val2 = str2num(fgetl(fid));

endfunction
