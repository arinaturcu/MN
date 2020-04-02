function [centroids] = clustering_pc(points, NC)
    cluster = [];
  centroids0 = [];
  [N, D] = size(points);

  % initializare
  for i = 0 : NC - 1
      cluster = [];
      for j = 1 : N
          p = points(j, :);

          if mod(j, NC) == i
              cluster = [cluster; p];
          endif
 
      endfor

      [diml, dimc] = size(cluster);
      sum = 0;
      for k = 1 : diml
          sum = sum + cluster(k, :);
      endfor

      centroids0 = [centroids0; sum / diml];
      
  endfor
cluster = [];
centroids = [];

  % calculare centroizi
  while 1
      for i = 1 : NC   
          for k = 1 : N
              p = points(k, :);
                  
              if ( min(distance(centroids0, p)) == distance(centroids0(i, :), p) )
                  cluster = [cluster; p];
              endif
              
          endfor
          % suma punctelor din cluster
          [diml, dimc] = size(cluster);
          sum = 0;
          for k = 1 : diml
              sum = sum + cluster(k, :);
          endfor
          
          centroids = [centroids; sum / diml];
          cluster = [];
      endfor
      
      if centroids == centroids0;
          break;
      endif

      centroids0 = centroids;
      centroids = [];

  endwhile
 
endfunction
