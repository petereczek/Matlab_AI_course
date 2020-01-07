%%used to generate the covariance matrix, not used in this example
function symat = mymat()
    A = 0.25*rand(8, 8);
    A_symmetric = tril(A) + triu(A', 1);
    d = [0.19 0.13 0.25 0.16 0.22 0.18 0.21 0.00]; % The diagonal values
    A_symmetric = tril(A) + triu(A');
    n = size(A_symmetric,1);
    A_symmetric(1:(n+1):end) =d;
    symat = A_symmetric;