function lambda = QR (A, tol, maxiter)
  lambda = [];
  [n m] = size(A);
  
  while n > 1
      for i = 1 : maxiter
          [Q R] = qr(A);
          A = R*Q;
      
          if abs(A(n-1, n)) < tol
              break;
          endif
      endfor
      
      lambda = [lambda; A(n, n)];
      A = A(1 : n-1, 1 : n-1);
      [n m] = size(A);
  endwhile
  
  if n == 1
      lambda = [lambda; A];
  endif

endfunction
