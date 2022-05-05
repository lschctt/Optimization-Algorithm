%% *************************************************************
%%                       Trust Region Algorithm
%% *************************************************************
%% Introduction of Parameters:
%  Output: k:number of interations  f:the value of min f(x)  
%          final_x:the final solution
%  input:  x:current x    f_type:choose type of functions
%          acc:the accuracy requirement   
%          alpha_max:Max of step-size     cc:cc[1] is c1 and cc[2] is c2
%          nm:nm(1) is dimension of x, nm(2) is dimension of f
%% *************************************************************
function [k, f, final_x] = TR(x, acc, f_type, nm)



end



%% *************************************************************
%%                Trust Region Algorithm Subproblem
%% *************************************************************
function lambda = TR_sub(B)