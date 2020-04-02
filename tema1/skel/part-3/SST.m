function [x] = SST(A, b)
  [m n] = size(A);
  x(n, 1) = b(n) / A(n, n);
  
  for i = n-1 : -1 : 1
      s = 0;
      for j = i+1 : n
          s = s + A(i, j) * x(j);
      endfor
      
      x(i) = (b(i) - s) / A(i, i);
  endfor
end
    