%%GA cost function for solving Travelling Salesman problem
%%Distances between each city pair stored in an nxn matrix, n->noof cities.
%%M(ij) is the distance from ith city to jth city
%%For example, 10 cities A-J
%{
  A  B  C  D  E  F  G  H  I  J
A 00 05 13 09 06 24 19 01 21 15
B 05 00 10 02 21 14 17 26 08 26
C 13 10 00 08 ...
D 09 02 08 00 ...
E 06 21 ...
F 24 14
G 19 17
H 01 26
I 21 08
J 15 26 ...
%}

%{
Also possible to generate random distances 
A = randi([0,100],10, 10);
A_symmetric = tril(A) + triu(A', 1);
d = 10*zeros(10,1);
A_symmetric = tril(A) + triu(A');
n = size(A_symmetric,1);
A_symmetric(1:(n+1):end) =d;
%}
%%The best route is found by minimizing the total sum of distances travelled between all
%%cities
function mysum = myfitness(x);
    A=[ 0    48    26    55    71     4    88    74    42    26;
    48     0    62    16     6    57    76    23    42    25;
    26    62     0    73    23    61    19    80    72     2;
    55    16    73     0    88    43    11    94    13    67;
    71     6    23    88     0     2    68    35    75    79;
     4    57    61    43     2     0     5    44    86    87;
    88    76    19    11    68     5     0    31    66    52;
    74    23    80    94    35    44    31     0     6    86;
    42    42    72    13    75    86    66     6     0    23;
    26    25     2    67    79    87    52    86    23     0];
    
    sum = 0;
    %%Can't set a restriction on input to generate unique chromosomes, so
    %%have to check for that in the body of the optimization function, if
    %%not unique, assign a sum greater than the greatest possible sum for a
    %%valid set of trips to eliminate it
    if length(unique(x))==length(x)
        for i=1:(length(x)-1)
            sum = sum+A(x(i),x(i+1));
        end
    else
        sum = 10000;
    end
       
    mysum = sum;
end
        



