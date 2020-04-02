function [lambda x1 iter] = MPI (A, y, miu, tol, max_iter)
     y0 = y;
     lambda0 = 0;
     iter = 0;
     [n n] = size(A);
     
     while 1
        z = (inv(A - miu*eye(n)))*y;
        y = z/norm(z);
        lambda = y'*A*y;
        miu = lambda;
        iter++;
        
        if norm(lambda - lambda0) < tol || iter >=max_iter
          break;
        endif
        
        lambda0 = lambda;
        x1 = y;
        
     endwhile   
endfunction
