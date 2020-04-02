function [x] = solve_low (L, b)
% Functie care rezolva un sistem inferior triunghiular

  [n n] = size(L);
  x(1) = b(1) / L(1, 1);
  
  for i = 2 : n
      s = 0;
      for j = 1 : i - 1
          s = s + L(i, j) * x(j);
      endfor
      
      x(i) = (b(i) - s) / L(i, i);
  endfor
  
endfunction
