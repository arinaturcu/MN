function R = Algebraic(nume, d)
    % Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
    % Intrari:
    %	-> nume: numele fisierului in care se scrie;
    %	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
    % Iesiri:
    %	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    fid = 0;
    fid = fopen(nume,  'r');
    fidout = fopen(strcat(nume,  '.out'),  'w');

    if fid < 1
        disp('Eroare la deschiderea fisierului');
    endif

    [M n] = list_to_matrix(fid);
    L = sum(M == 1, 2);

    M = (diag(1 ./ L(L != 0)) * M)';

    R = PR_Inv(eye(n) - d * M) * ((1 - d) / n) * ones(n, 1);

    fclose(fid);

endfunction
