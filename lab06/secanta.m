function [sol] = secanta (a, b, f, tol)
   iteratii=1;
   sol0 = (a*f(b) - b*f(a)) / (f(b) - f(a));
   sol = sol0;
    while 1
      if f(sol0)*f(a) < 0
          sol = (a*f(sol0) - sol0*f(a)) / (f(sol0) - f(a));
          b = sol0;
      endif
      if f(sol0)*f(b) < 0
          sol = (sol0*f(b) - b*f(sol0)) / (f(b) - f(sol0));
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
