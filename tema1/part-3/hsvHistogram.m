function [sol] = hsvHistogram(path_to_image, count_bins)
  M = imread(path_to_image);
  R = M(:, :, 1);
  G = M(:, :, 2);
  B = M(:, :, 3);
  
  [n m] = size(R);
  H = zeros(1, n*m);
  S = zeros(1, n*m);
  V = zeros(1, n*m);
  
  R = reshape(R, 1, n*m);
  G = reshape(G, 1, n*m);
  B = reshape(B, 1, n*m);
  
  [H S V] = rgb2hsv2(R, G, B);
  
  val = linspace(0, 1, count_bins + 1);
  
  his_H = his_S = his_V = zeros(1, count_bins);
  
  his_H = histc(H, val*1.01); 
  his_H(count_bins) += his_H(count_bins+1);
  his_H(count_bins+1) = [];

  his_S = histc(S, val*1.01);
  his_S(count_bins) += his_S(count_bins+1);
  his_S(count_bins+1) = [];

  his_V = histc(V, val*1.01);
  his_V(count_bins) += his_V(count_bins+1);
  his_V(count_bins+1) = [];
  
  sol = cat(2, his_H, his_S, his_V);
endfunction