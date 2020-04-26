function [Q R b] = givens(A, b)
  [m n] = size(A);
  Q = eye(m);
	
  for k = 1 : min(m-1, n)
    for l = k + 1 : m
            r = sqrt(A(k,k)^2 + A(l,k)^2);
            c = A(k,k)/r;
            s = -A(l,k)/r;
            
            aux = [c -s; s c]*[A(k,k:n); A(l,k:n)];
            A(k,k:n) = aux(1, :);
            A(l,k:n) = aux(2, :);

            aux = [c -s; s c]*[b(k); b(l)];
            b(k) = aux(1);
            b(l) = aux(2);
            
            aux = [c -s; s c]*[Q(k,1:m); Q(l,1:m)];
            Q(k,1:m) = aux(1, :);
            Q(l,1:m) = aux(2, :);
            
      end
   end
    
  Q = Q';
  R = A;
end
