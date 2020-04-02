function [s] = vectorizare(x)
  for i = 1:length(x)
    s(i) = sqrt(x(i));
  endfor
 %s = sqrt(x);
endfunction
