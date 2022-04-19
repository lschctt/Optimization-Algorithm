%% *************************************************************
%%                  find a right step size
%% *************************************************************
%% Introduction of Parameters:
%  Output: alpha_star :a right step size
%  input:  alpmax: max of the step length   f_type:choose type of functions 
%          x:current x    
%          c:c[1] is c1 and c[2] is c2   d:the descending direction of x
%          nm:nm(1) is dimension of x, nm(2) is dimension of f
%% *************************************************************
function alpha_star = StepSize(alpha_max,c,x,d,f_type,nm)
    alpha0=1;               %initialize alpha0
    init=zeros(1000,1);     %initialize init, init is used to record alpha(stap size) to go back to the previous alpha
    x_grad=fun(x,2,f_type, nm);    %compute the gradient of x
    for i=1:100
        if i > 1
            alpha_pr = init(i - 1);
            alpha = (alpha_max - alpha_pr) * rand(1) + alpha_pr;
            x_pr = x + alpha_pr * d;
        else
            alpha = alpha0 + (alpha_max-alpha0) *rand(1);
            alpha_pr = 1e-7;
            x_pr = x;
        end
        
        init(i) = alpha;
        
        x_new=x+alpha*d;
        x_new_grad=fun(x_new,2,f_type, nm);
        
        if((fun(x_new,1,f_type, nm) > fun(x,1,f_type, nm)+c(1)*alpha*dot(x_grad,d)) || ( (i>1) && (fun(x_new,1,f_type, nm)>=fun(x_pr,1,f_type, nm)) ) )
            alpha_star=Zoom(alpha_pr,alpha,c,x,d,f_type,nm);
            return
        end


        if(abs(dot(x_new_grad,d)) <= (-c(2)*dot(x_grad,d)) )
            alpha_star=alpha;
            return
        end
        
        if(dot(x_new_grad,d)>=0)
            alpha_star=Zoom(alpha, alpha_pr,c,x,d,f_type,nm);
            return
        end
    end
    alpha_star = 1e-7;
    return 
    
end