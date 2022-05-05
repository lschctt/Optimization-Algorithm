%% *************************************************************
%%                  Conjugate Algorithm
%                (subproblem of Newton-CG)
%%               min f(x):= 0.5 x'*A*x - b'*x
%% *************************************************************
%% Introduction of Parameters:
%  Output: xx:the result of argmin f(x)
%  input:  A:coefficient matrix  b:disturbance  x:current x  
%          acc:the accuracy requirement   
%% *************************************************************
function xx = CG(A,b,x,acc)

format long
[r_A,c_A] = size(A);

emin = min(eig(A));
A = A + (-emin + abs(emin))*eye(r_A,c_A);

r = A * x - b; d = -r; k = 1;
Norm_r=norm(r);

% disp(' ')
% disp('Conjugate gradient method for solving unconstrained minimization:')
% disp('k         Grad_norm         isconjugate')

while(Norm_r>acc)
    if x'*A*x <= 0
        % b is -gradient
        xx = b;
        return
    end
    Ad = A * d;
    alpha = ((Norm_r)^2)/(d'*Ad);

    x = x + alpha * d;
    r_next = r + alpha * Ad;

    beta = (r_next' * r_next) / (r' * r);
    d_new = -r_next + beta * d;
    
    %isconjugate = d_new'*Ad;

    % fprintf("\n%d    %e    %e",k,Norm_r,isconjugate)

    r = r_next;
    d = d_new;

    k = k + 1;
    Norm_r = norm(r);
end

xx = x;

end