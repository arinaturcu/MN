% rezolvare de sistem supradeterminat Ax=b (m>n) folosind metoda givens
A=[1 0 0; 0 1 10; 0 0 1; -1 1 0; 0 -1 1; -1 0 1];
b=[1 2 3 1 2 3]';
[m n]=size(A);
[Q R bb] = givens(A, b);
x=SST(R(1:n,1:n),bb(1:n))
%pentru proba rulati comanda A\b