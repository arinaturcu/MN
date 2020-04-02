function [sol] = bisection (a, b, f, tol)
    iteratii = 1;
    sol0 = (a + b)/2;
    sol = sol0;
    while 1
      if f(sol0)*f(a) < 0
          sol = (sol0 + a)/2;
          b = sol0;
      endif
      if f(sol0)*f(b) < 0
          sol = (sol0 + b)/2;
          a = sol0;
      endif
      
      iteratii++;
      if abs((sol - sol0)/sol) < tol
        iteratii
        break;
      endif
      
      sol0 = sol;
    endwhile

endfunction
