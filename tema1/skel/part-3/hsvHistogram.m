function [sol] = hsvHistogram(path_to_image, count_bins)
  M = imread(path_to_image);
  R = M(:, :, 1);
  G = M(:, :, 2);
  B = M(:, :, 3);
  
  [n m] = size(R);
  H = zeros(n, m);
  S = zeros(n, m);
  V = zeros(n, m);
  
  for i = 1 : n
      [H(i, :) S(i, :) V(i, :)] = rgb2hsv2(R(i, :), G(i, :), B(i, :));
  endfor
  
  val = linspace(0, 1, count_bins + 1);
  
  for i = 0 : count_bins - 1  
      his_H(i+1) = sum(sum(H(:, :) >= i*1.01/count_bins & H(:, :) < (i + 1)*1.01/count_bins));
      his_S(i+1) = sum(sum(S(:, :) >= i*1.01/count_bins & S(:, :) < (i + 1)*1.01/count_bins));
      his_V(i+1) = sum(sum(V(:, :) >= i*1.01/count_bins & V(:, :) < (i + 1)*1.01/count_bins));
  endfor
  sol = cat(2, his_H, his_S, his_V);
endfunction