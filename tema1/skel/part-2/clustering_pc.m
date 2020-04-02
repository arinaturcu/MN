function [centroids] = clustering_pc(points, NC)
    cluster = [];
  centroids0 = [];
  [N, D] = size(points);

  % initializare
  for i = 0 : NC - 1
      cluster = [];
      for j = 1 : N
          p = points(j, :);

          if (floor(norm(mod(p, NC))) == i)
              cluster = [cluster; p];
          endif
 
      endfor

      [diml, dimc] = size(cluster);
      sum = 0;
      for k = 1 : diml
          sum = sum + cluster(k, :);
      endfor
      
      if (diml != 0)
          centroids0 = [centroids0; sum / diml];
      endif
      if (diml == 0)
          centroids0 = [centroids0; zeros(1, D)];
      endif

  endfor
cluster = [];
centroids = [];
  % calculare centroizi
  while 1
      
      for i = 1 : NC
          copy_pct = points
          for k = 1 : N
              p = copy_pct(k, :);
              if ( min(distance(centroids0, p)) == distance(centroids0(i, :), p) )
                  cluster = [cluster; p];
                  copy_pct(k, :) = [];
              endif
          endfor
      
          [diml, dimc] = size(cluster);
          sum = 0;
          for k = 1 : diml
              sum = sum + cluster(k, :);
          endfor
          
          if (diml != 0)
              centroids = [centroids; sum / diml];
          endif
          if (diml == 0)
              centroids = [centroids; zeros(1, D)];
          endif
      cluster = [];
      endfor
      
      if centroids == centroids0
          break;
      endif
        
      centroids0 = centroids;
      centroids = [];
      
  endwhile
 
endfunction
