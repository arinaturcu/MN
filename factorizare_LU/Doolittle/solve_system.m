function [x] = solve_system (A, b)
  
  [L, U] = doolittle(A);
% disp(L)
% disp(' ')
% disp(U)
  y = solve_low(L, b);
  x = solve_up(U, y);

endfunction
