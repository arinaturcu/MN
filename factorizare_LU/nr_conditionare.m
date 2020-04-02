function [c] = nr_conditionare (A)
  
  c = sqrt(max(abs(eig(A*A')))) * sqrt(max(abs(eig((A^-1)*(A^-1)'))));

endfunction
