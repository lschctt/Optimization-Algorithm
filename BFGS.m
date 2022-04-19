%% *************************************************************
%%                       BFGS Algorithm
%% *************************************************************
%% Introduction of Parameters:
%  Output: k:number of interations  f:the value of min f(x)  
%          final_x:the final solution
%  input:  x:current x    f_type:choose type of functions
%          acc:the accuracy requirement   
%          alpha_max:Max of step-size     cc:cc[1] is c1 and cc[2] is c2
%          nm:nm(1) is dimension of x, nm(2) is dimension of f
%% *************************************************************
function [k, f, final_x] = BFGS(x, acc, alpha_max, cc, f_type, nm)

disp('BFGS method for solving unconstrained minimization:')
disp('k         Grad_norm         rho         alpha')

n = nm(1);
% choose H0
H = eye(n,n);
k=1;
f_grad = fun(x,2,f_type,nm);

while norm(f_grad) >= acc
    d = -H*f_grad;
    alpha = StepSize(alpha_max, cc, x, d, f_type,nm);

    x = x + alpha*d;
    f_grad_new = fun(x, 2, f_type, nm);

    sk = alpha*d;
    yk = f_grad_new - f_grad;

    rho_k = 1/(yk'*sk);

    fprintf("\n%d    %e    %f    %f", k, norm(f_grad_new), yk'*sk, alpha)

    if k == 1
        pa = (yk'*sk) / dot(yk, yk);
        H = pa * H;
    end

    syT = sk*yk';
    HysT = H*yk*sk';
    % Q = eye(n,n) - rho_k*syT;
            
    % H = Q* H *Q' + rho_k*(sk*sk');
    % H = (eye(n,n) - rho_k * (sk*yk')) * H * (eye(n,n) - rho_k * (yk*sk')) + rho_k * (sk*sk');

    H = H + rho_k*(- HysT' - HysT + rho_k*syT*HysT + sk*sk');

    k = k+1;
    f_grad = f_grad_new;

end

f = fun(x, 1, f_type, nm);
final_x = x;

end