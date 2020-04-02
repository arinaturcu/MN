function [curs] = stare(file_name)
  fid = fopen(file_name, 'r');
  final = fseek(fid, 0, 'eof');
  curs = ftell(fid);
  endfunction