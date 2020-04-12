function [values, colind, rowptr] = matrix_to_csr(A)
    [n n] = size(A);
    values = [];
    colind = [];
    rowptr = [];

    for i = 1:n
        first = 0;

        for j = 1:n

            if A(i, j) != 0
                first++;
                values = [values, A(i, j)];
                [cah m] = size(values);
                colind = [colind, j];

                if (first == 1)
                    rowptr = [rowptr, m];
                endif

            endif

        endfor

    endfor

    rowptr = [rowptr, m + 1];

endfunction
