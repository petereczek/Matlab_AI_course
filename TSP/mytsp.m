
clear, clc;
%Restrict the input vectors(chromosomes) to integers
IntCon = [1 2 3 4 5 6 7 8 9 10];
%%stuff.A = A_symmetric;
fitn = @myfitness;
%%Integers between 1 and 10 (size of maze)
lb = [1;1;1;1;1;1;1;1;1;1];
ub = [10;10;10;10;10;10;10;10;10;10];
opts = optimoptions(@ga,'PopulationSize',700);
%%myfitness(A_symmetric,myx)
[val, opti] = ga(fitn,10,[],[],[],[],lb,ub,[],IntCon, opts)

