%% *************************************************************
%%                       FR Algorithm
%% *************************************************************
%% Introduction of Parameters:
%  Output: k:number of interations  f:the value of min f(x)  
%          final_x:the final solution
%  input:  x:current x    f_type:choose type of functions
%          acc:the accuracy requirement   
%          alpha_max:Max of step-size     cc:cc[1] is c1 and cc[2] is c2
%          nm:nm(1) is dimension of x, nm(2) is dimension of f
%% *************************************************************
function [k, f, final_x] = FR(x, acc, alpha_max, cc, f_type, nm)

disp('FR method for solving unconstrained minimization:')
disp('k         Grad_norm         <d, f_grad_new>         f')

f_grad = fun(x, 2, f_type, nm);
d = -f_grad;                %get the direction
k = 0;

while norm(f_grad) >= acc
    alpha = StepSize(alpha_max, cc, x, d, f_type, nm);
    x = x + alpha * d;

    f_grad_new = fun(x, 2, f_type, nm);
    beta_FR = (f_grad_new' * f_grad_new) / (f_grad' * f_grad);
    d = - f_grad_new + beta_FR * d;

    ff = fun(x, 1, f_type, nm);
    isfall = dot(d, f_grad_new);

    fprintf("\n%d    %e    %f    %f", k, norm(f_grad_new), isfall, ff)


    k = k + 1;
    f_grad = f_grad_new;

end

f = fun(x, 1, f_type, nm);
final_x = x;

end
