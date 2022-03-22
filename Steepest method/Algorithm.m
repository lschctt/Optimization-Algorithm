% alpha_star:返回值，即合适的步长
% alpha_max:步长最大值 A:方程组系数矩阵  b:方程组常数  c:包含常数c1、c2  x:当前位置自变量
function alpha_star = Algorithm(alpha_max,A,b,c,x)
    alpha0=0;               %初始化alpha0
    init=zeros(1000,1);     %初始化init，init用于记录过程中产生的步长，便于回溯上一个步长
    x_grad=fun(A,b,x,2);    %计算梯度
    d=-x_grad;              %计算方向
    for i=1:100
        if i > 1
            alpha_pr = init(i - 1);
            alpha = (alpha_max - alpha_pr) * rand(1) + alpha_pr;
            x_pr = x + alpha_pr * d;
        else
            alpha = alpha_max*rand(1);
            alpha_pr = alpha0;
            x_pr = x;
        end
        
        init(i)=alpha;
        
        x_new=x+alpha*d;
        x_new_grad=fun(A,b,x_new,2);
        
        if((fun(A,b,x_new,1) > fun(A,b,x,1)+c(1)*alpha*dot(x_grad,d)) || ( (i>1) && (fun(A,b,x,1)>=fun(A,b,x_pr,1)) ) )
            alpha_star=Zoom(alpha_pr,alpha,A,b,c,x);
            return
        end
        
        if(abs(dot(x_new_grad,d)) <= (-c(2)*dot(x_grad,d)) )
            alpha_star=alpha;
            return
        end
        
        if(dot(x_new_grad,d)>=0)
            alpha_star=Zoom(alpha, alpha_pr,A,b,c,x);
            return
        end
    end
    
end