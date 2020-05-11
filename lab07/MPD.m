function [lambda x1 iter] = MPD (A, y, tol, max_iter)
     y0 = y;
     lambda0 = 0;
     iter = 0;
     [n n] = size(A);
     
     while 1
        z = A*y;
        y = z/norm(z);
        lambda = y'*A*y;
        iter++;
        
        if norm(lambda - lambda0) < tol || iter >=max_iter
          break;
        endif
        
        lambda0 = lambda;
        x1 = y;
        
     endwhile
    
endfunction
