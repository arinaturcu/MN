function [R1 R2] = PageRank(nume, d, eps)
    % Calculeaza indicii PageRank pentru cele 3 cerinte
    % Scrie fisierul de iesire nume.out

    fidout = 0;
    fidout = 0;
    fidin = fopen(nume,  'r');
    fidout = fopen(strcat(nume,  '.out'),  'w');

    % verific daca fisierele s-au deschis corect
    if fidout < 1 || fidin < 1
        disp('Eroare la deschiderea fisierului');
    endif

    R1 = Iterative(nume, d, eps);
    R2 = Algebraic(nume, d);

    fprintf(fidout,  '%d\n\n', size(R1, 1));
    fprintf(fidout,  '%f\n', R1);
    fprintf(fidout,  '\n');
    fprintf(fidout,  '%f\n', R2);

    [mat, N, val1, val2] = list_to_matrix(fidin);

    % adaug o coloana auxiliara pentru retinerea numarului paginilor
    R2(:, 2) = 1:N;

    % sortez descrescator dupa prima coloana
    R2 = sortrows(R2, -1);

    fprintf(fidout,  '\n');

    for i = 1:N
        imp = Apartenenta(R2(i, 1), val1, val2)
        fprintf(fidout,  '%d %d %f\n', i, R2(i, 2), imp);
    endfor

    % sterg coloana auxiliara pentru ca nu mai am nevoie de ea
    R2 = R2(:, 1);

    fclose(fidout);
endfunction
