%% *************************************************************
%%                       L-BFGS Algorithm
%% *************************************************************
%% Introduction of Parameters:
%  Output: k:number of interations  f:the value of min f(x)  
%          final_x:the final solution
%  input:  x:current x    f_type:choose type of functions
%          acc:the accuracy requirement   alpha_max:Max of step-size
%          cc:cc(1) is c1 and cc(2) is c2     m:the number of {si,yi} we store
%          nm:nm(1) is dimension of x, nm(2) is dimension of f
%% *************************************************************
function [k, f, final_x] = L_BFGS(x, acc, alpha_max, cc, f_type, nm, m)

disp('BFGS method for solving unconstrained minimization:')
disp('k         Grad_norm         rho         alpha')

% choose H0
H = eye(nm(1),nm(1));
k=1;
f_grad = fun(x,2,f_type,nm);
s = zeros(nm(1),m);
y = zeros(nm(1),m);
HG = H*f_grad;

while norm(f_grad) >= acc
    d = -HG;
    alpha = StepSize(alpha_max, cc, x, d, f_type,nm);

    x = x + alpha*d;
    f_grad_new = fun(x, 2, f_type, nm);

    sk = alpha*d;
    yk = f_grad_new - f_grad;
    
    if k > m
        s(:,1:m-1) = s(:,2:m);
        s(:,m) = sk;
        y(:,1:m-1) = y(:,2:m);
        y(:,m) = yk;
    else
        s(:,k) = sk;
        y(:,k) = yk;
    end

    fprintf("\n%d    %e    %f    %f", k, norm(f_grad_new), yk'*sk, alpha)

    if mod(k,m)==1
        pa = (yk'*sk) / dot(yk, yk);
        H = pa * H;
    end

    HG = Loop(m, k, f_grad_new, H, s, y);

    k = k+1;
    f_grad = f_grad_new;

end

f = fun(x, 1, f_type, nm);
final_x = x;
end


%% *************************************************************
%%                       Loop Algorithm
%% *************************************************************
% Introduction of Parameters:
%  Output: HG: H*Gradient
%  input:  m:the number of {si,yi} we store      H0:initial H
%          s:a matrix which stores {s_{k-m},s_{k-m+1},...,s_k}
%          y:a matrix which stores {y_{k-m},y_{k-m+1},...,y_k}
%          k:the current iteration number
%% *************************************************************
function HG = Loop(m, k, grad, H0, s, y)

q = grad;
alpha_list = zeros(m,1);
% when the si,yi we have stored less than m, we can only iterate k times 
for i = min(k,m):-1:1
    rho = 1/(y(:,i)'*s(:,i));
    alphai = rho*s(:,i)'*q;
    alpha_list(i) = alphai;
    q = q - alphai*y(:,i);
end

r = H0*q;

% when the si,yi we have stored less than m, we can only iterate k times
for i = 1:1:min(k,m)
    rho = 1/(y(:,i)'*s(:,i));
    beta = rho*y(:,i)'*r;
    alphai = alpha_list(i);
    r = r + s(:,i)*(alphai - beta);
end

HG = r;
end