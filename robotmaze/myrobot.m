
clear, clc;
%% Create a range array from 1 to 20 that will record the moves
%%IntCon = linspace(1,100);
%%All 20 inputs
IntCon = linspace(1,18,18);
%%IntCon = linspace(1,25,25);
fitn = @myfitness;

%% Create array of size 20 with lower range 1, 1-4 stand for the moves down, right, up, left
%%lb = ones(1,100);
lb = ones(1,18);
%%lb = ones(1,25);
%% Create array of size 20 with upper range 4
%%ub = 4*ones(1,100);
ub = 4*ones(1,18);
%%ub = 4*ones(1,25);
opts = optimoptions(@ga,'PopulationSize',2000, 'MaxGenerations',1000,'MaxStallGenerations',Inf);
[val, opti] = ga(fitn,18,[],[],[],[],lb,ub,[],IntCon, opts)

