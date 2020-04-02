function [x] = solve_up (U, b)
% Functie care rezolva un sistem superior triunghiular

  [n n] = size(U);
  x(n) = b(n) / U(n, n);
  
  for i = (n - 1) :-1: 1
      s = 0;
      for j = (i + 1) : n
          s = s + U(i, j) * x(j);
      endfor
      
      x(i) = (b(i) - s) / U(i, i);
  endfor

endfunction
