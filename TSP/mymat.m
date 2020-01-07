function symat = mymat()
    A = randi([0,100],10, 10);
    A_symmetric = tril(A) + triu(A', 1);
    d = 10*zeros(10,1); % The diagonal values
    A_symmetric = tril(A) + triu(A');
    n = size(A_symmetric,1);
    A_symmetric(1:(n+1):end) =d;
    symat = A_symmetric;