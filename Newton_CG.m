%% *************************************************************
%%                       Newton-CG Algorithm
%% *************************************************************
%% Introduction of Parameters:
%  Output: k:number of interations  f:the value of min f(x)  
%          final_x:the final solution
%  input:  x:current x    f_type:choose type of functions
%          acc:the accuracy requirement   
%          alpha_max:Max of step-size     cc:cc[1] is c1 and cc[2] is c2
%          nm:nm(1) is dimension of x, nm(2) is dimension of f
%% *************************************************************
function [k, f, final_x] = Newton_CG(x, acc, alpha_max, cc, f_type, nm)

disp('BFGS method for solving unconstrained minimization:')
disp('k         Grad_norm         rho         alpha')

f_grad = fun(x,2,f_type,nm);
k = 1;
change = 0;

while norm(f_grad) > acc
    if change == 1
        acc1 = min(min(sqrt(norm(f_grad)), 0.5)*norm(f_grad),1e-5);
        change = 0;
    else
        acc1 = min(sqrt(norm(f_grad)), 0.5)*norm(f_grad);
    end

    % acc1 = 1e-8; % 阻尼Newton accuracy

    B = fun(x,3,f_type,nm);

    d = CG(B,-f_grad,x,acc1);

    alpha = StepSize(alpha_max, cc, x, d, f_type,nm);

    % if the step size so small, next accuracy should be change 
    if alpha < 1e-5
        change = 1;
    end

    fprintf("\n%d    %e    %f", k, norm(f_grad), alpha)

    x = x + alpha * d;

    f_grad = fun(x,2,f_type,nm);
    k = k + 1;

end

f = fun(x, 1, f_type, nm);
final_x = x;

end




