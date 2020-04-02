function [sol] = rgbHistogram(path_to_image, count_bins)
  M = imread(path_to_image);
  R = M(:, :, 1);
  G = M(:, :, 2);
  B = M(:, :, 3);
  
  for i = 0 : 255
      his_R(i+1) = sum(sum(R(:, :) == i));
      his_G(i+1) = sum(sum(G(:, :) == i));
      his_B(i+1) = sum(sum(B(:, :) == i));
  endfor
  
  subs = floor([1:256]*count_bins/256)+1;
  subs(256) = [];
  aux = 1;
  subs = cat(2, aux, subs);
  
  sol_R = accumarray(subs', his_R)';
  sol_G = accumarray(subs', his_G)';
  sol_B = accumarray(subs', his_B)';
  
  sol = cat(2, sol_R, sol_G, sol_B);
end
