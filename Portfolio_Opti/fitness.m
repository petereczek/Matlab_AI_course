%%GA cost function for solving portfolio optimization problem
%%Average yearly returns and average yearly volatilities stored in an nx2 matrix, 
%%n->noof financial instruments (such as stocks).
%%M(ij) jth metric (here only return or volatility) of the ith instrument
%%Returns an array of weights corresponding to each of the stocks based on
%%highest portfolio Sharpe ratio. Since the algorithm minimizes by default
%%We will aim to minimize the inverse 
%%For example, 8 stocks
%{
  ret    volat
A 0.09   0.19 
B 0.05   0.13 
C 0.13   0.25 
D 0.07   0.16
E 0.11   0.22
F 0.08   0.18
G 0.10   0.21
H 0.01   0.00
%}


function sharpe = fitness(x);
    %%normalize the weights vector
    n = x/sum(x);
    %% initialize returns vector
    rets = [0.153; 
0.156;
0.112;
0.210;
];
    %%initialize the symmetric covariance matrix, this is used to calculate
    %%the portfolio volatility
    varmat = [0.0683    0.0179    0.0145    0.0190;
              0.0179    0.0513    0.0180    0.0200;
              0.0145    0.0180    0.0352    0.0149;
              0.0190    0.0200    0.0149    0.0945;
              
];
    avreturn = dot(n,rets);
    avvolat = sqrt(n*varmat*n.');
    %%Minimizing the inverse of Sharpe Ratio to maximize the Sharpe Ratio
    %%(ret/volat) of the portfolio. Usually, any Sharpe ratio greater than 
    %% 1.0 is considered acceptable to good by investors. A ratio higher than 2.0 is rated as very good.
    sharpe = avvolat/avreturn
end
        



