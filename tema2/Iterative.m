function R = Iterative(nume, d, eps)
    % Functia care calculeaza matricea R folosind algoritmul iterativ.
    % Intrari:
    %	-> nume: numele fisierului din care se citeste;
    %	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
    %	-> eps: eruarea care apare in algoritm.
    % Iesiri:
    %	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    fid = 0;
    fid = fopen(nume,  'r');

    if fid < 1
        disp('Eroare la deschiderea fisierului');
    endif

    [M n] = list_to_matrix(fid);

    R0(1:n, 1) = 1 / n;
    R(1:n, 1) = NaN;

    while 1

        for i = 1:n
            n_link = sum(M == 1, 2)(M(:, i) == 1);
            R_link = R0(M(:, i) == 1);

            R(i) = (1 - d) / n + d * sum(R_link ./ n_link);
        endfor

        if abs(R - R0) <= eps
            R = R0;
            break
        endif

        R0 = R;
    endwhile

    fclose(fid);

endfunction
