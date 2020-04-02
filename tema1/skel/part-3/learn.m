function [w] = learn(X, y)
  [Q R] = Householder(X);
  y1 = Q'*y;
  w = SST(R, y1);
end
