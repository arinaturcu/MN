function [A, b] = generate_probabilities_system(rows)
  n = rows*(rows + 1)/2;
  A = zeros(n);
  b = zeros(n, 1);
  b(n-rows+1:n) = 1;
  
  %colturile triunghiului
  A(1, 1) = 4;
  A(n-rows+1, n-rows+1) = 4;
  A(n, n) = 4;
  
  A(1, 2) = -1;
  A(1, 3) = -1;
  
  A(n, n-rows) = -1;
  A(n, n-1) = -1;
  
  A(n-rows+1, n-rows+2) = -1;
  A(n-rows+1, n-2*rows+2) = -1;
  
  %laturile dreapta & stanga ale triunghiului
  k = 1;
  for i = 1 : rows-2
    A(k+i, k+i) = 5;
    A(k+i, k+i+1) = -1;
    A(k+i, k) = -1;
    A(k+i, k+2*i+1) = -1;
    A(k+i, k+2*i+2) = -1;
    k = k + i;
  endfor
  
  k = 1;
  for i = 2 : rows-1
    A(k+i, k+i) = 5;
    A(k+i, k+i-1) = -1;
    A(k+i, k) = -1;
    A(k+i, k+2*i) = -1;
    A(k+i, k+2*i+1) = -1;
    k = k + i;
  endfor
  
  %baza triunghiului
  for i = n-rows+2 : n-1
      A(i, i) = 5;
      A(i, i-1) = -1;
      A(i, i+1) = -1;
      A(i, i-rows) = -1;
      A(i, i-rows+1) = -1;
  endfor
  
  %restul triunghiului
  my_prev_nr = 2;
  my_nr = 5;
  
  for i = 3 : rows-1
      for j = i-1 : -1: 2
          A(my_nr, my_nr) = 6;
          A(my_nr, my_nr-1) = -1;
          A(my_nr, my_nr+1) = -1;
          A(my_nr, my_prev_nr) = -1;
          A(my_nr, my_prev_nr+1) = -1;
          A(my_nr, my_nr+i+1) = -1;
          A(my_nr, my_nr+i) = -1;
        
          if j != 2
            my_nr = my_nr-1;
            my_prev_nr = my_prev_nr-1;
          endif
        
      endfor
      
      my_prev_nr = my_nr + i - 3;
      my_nr = my_prev_nr+i+1;
      
  endfor
    
endfunction
