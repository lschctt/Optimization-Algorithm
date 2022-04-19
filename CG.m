%% *************************************************************
%%                  Conjugate Algorithm
%%               min f(x):= 0.5 x'*A*x - b'*x
%% *************************************************************
%% Introduction of Parameters:
%  Output: k:number of interations  f:the value of min f(x)  Eig:eigenvalue of A
%  input:  A:coefficient matrix  b:disturbance  x:current x  
%          acc:the accuracy requirement   iseig:1:output eigenvalue of A, else:output 0 
%% *************************************************************
function [xx,Eig] = CG(A,b,x,acc,iseig)

format long

if iseig == 1
    [~,lam] = eig(A);      % get the eigenvalues of A，lam is diagonal matrix 
    Eig = diag(lam);       % get the eigenvalues of A
else
    Eig = 0;
end

% disp('Conjugate gradient method for solving unconstrained minimization:')
% disp('k         Grad_norm         isconjugate')

r = A * x - b; d = -r; k = 1; r_next = 0;
Norm_r=norm(r);

while(Norm_r>acc)
    Ad = A * d;
    alpha = ((Norm_r)^2)/(d'*Ad);

    x = x + alpha * d;
    r_next = r + alpha * Ad;

    beta = (r_next' * r_next) / (r' * r);
    d_new = -r_next + beta * d;
    isconjugate = d_new'*Ad;

    % fprintf("\n%d    %e    %e",k,Norm_r,isconjugate)

    r = r_next;
    d = d_new;

    k = k + 1;
    Norm_r = norm(r);
end

xx = x;

end