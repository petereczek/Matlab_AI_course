
clear, clc;
%%stuff.A = A_symmetric;
opt = @fitness;

lb = [0;0;0;0];
ub = [1;1;1;1];
opts = optimoptions(@ga,'PopulationSize',1000,'FunctionTolerance',1.0000e-06);
%%myfitness(A_symmetric,myx), define chromosome size, [] are parameters we
%%are not inputting, include optimization options
[val, sharpe] = ga(opt,4,[],[],[],[],lb,ub,[],opts);
%%Output the percentage of each security in the portfolio
finalval = val/sum(val)
%%Output the sharpe ratio for the optimal portfolio
finalsharpe = 1/sharpe

