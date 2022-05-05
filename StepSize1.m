%% *************************************************************
%%                  find a right step size
%% *************************************************************
%% Introduction of Parameters:
%  Output: alpha_star :a right step size
%  input:  alpmax: max of the step length   f_type:choose type of functions 
%          x:current x    
%          c:c[1] is c1 and c[2] is c2   d:the descending direction of x
%% *************************************************************
function alpha_star = StepSize1(alpha_max,c,x,d,f_type)
[n,~]=size(x); 
gk = fun(x,2,f_type,n);
dk = d;
cratio = gk'*dk;
c1 = c(1);
c2 = c(2);

fk = fun(x,1,f_type,n);

alpha_old = 0;

fold = fun(x,1,f_type,n);

alpha = 1;

for i=1:100
    xnew = x+alpha*dk;

    fnew = fun(xnew,1,f_type,n);
    gnew = fun(xnew,2,f_type,n);

    if (fnew> fk + c1*alpha*cratio) || (i>1 && fnew>=fold)

        alpha_star = zoom1(alpha_old,alpha,fold,x,fk,dk,cratio,f_type,c);

        iter = i;
        
        return;
    end
    
    cratio_new = gnew'*dk;

    if abs(cratio_new)<=-c2*cratio  %% successful!!!
     
        alpha_star = alpha;
        
        iter = i;
        
        return;

    elseif cratio_new>=0
      
        alpha_star = zoom1(alpha,alpha_old,fnew,x,fk,dk,cratio,f_type,c);
        
        iter = i;
        
        return;
    end
    
    alpha_old = alpha;  fold = fnew;
            
    alpha = alpha_old+(alpha_max-alpha_old)/2;

end

alpha_star = alpha;

iter = i;

end

%% ********************* zoom function *****************************
%%
function alpha_star = zoom1(lalpha,halpha,flow,xk,fk,dk,cratio,f_type,c)
c1 = c(1);
c2 = c(2);
[n,~]=size(xk); 

flag = 1;

while (flag)
    
    talpha = lalpha+(halpha-lalpha)/2;
    
    xt = xk + talpha*dk;
    
    ft = fun(xt,1,f_type,n);
    gt = fun(xt,2,f_type,n);
    
    if (ft> fk + c1*talpha*cratio) || (ft>=flow)
        
        halpha = talpha;
        
    else
        tcratio = gt'*dk;
        
        if abs(tcratio)<=-c2*cratio
            
            alpha_star = talpha;
            
            return;
        end
        
        if tcratio*(halpha-lalpha)>=0
            
            halpha = lalpha;
        end
        lalpha = talpha;
        
        flow = ft;
        
    end

    if abs(halpha-lalpha)<0.000001
        alpha_star = halpha;
        disp(' ')
        disp("***************************")
        return
    end
end
end

