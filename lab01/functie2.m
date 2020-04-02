function [cuvant] = functie2(fisier)
  fid = fopen (fisier, 'r');
  cuvant = fscanf(fid, "%s", 2);
endfunction