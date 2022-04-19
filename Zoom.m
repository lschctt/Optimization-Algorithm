%% *************************************************************
%%            narrow the range to find a right step size
%% *************************************************************
%% Introduction of Parameters:
%  Output: f_alpha:a right step size
%  input:  alp1: left of the range  alph2: right of the range
%          x:current x   f_type:choose type of functions
%          c:c[1] is c1 and c[2] is c2   d:the descending direction of x
%          nm:nm(1) is dimension of x, nm(2) is dimension of f
%% *************************************************************
function f_alpha = Zoom(alp1,alp2,c,x,d,f_type,nm)
    % n: dimension of x, not all questions need
%      disp(' ')
%      disp('Using the zoom function')
     alp = (alp1 + alp2) / 2;      %using bisection to find a trial step length
     x_grad=fun(x,2,f_type, nm);          %compute the gradient of x
     x_new=x+alp*d;                %find new x with alp
     x_new_grad=fun(x_new,2,f_type, nm);  %compute the gradient of x_new

     % When debug, we may need them.     
%      fprintf("\nLHS1: %f", fun(x_new,1,f_type))
%      fprintf("\nRHS1: %f", fun(x,1,f_type)+c(1)*alp*dot(x_grad,d))
     if((fun(x_new,1,f_type, nm) > fun(x,1,f_type, nm)+c(1)*alp*dot(x_grad,d)) || (fun(x_new,1,f_type, nm)>=fun(x+alp1*d,1,f_type, nm)))
         alp2=alp;
     
     else
         % When debug, we may need them.
%          fprintf("\nLHS2: %f", abs(dot(x_new_grad,d)))
%          fprintf("\nRHS2: %f", (-c(2)*dot(x_grad,d)))
          if(abs(dot(x_new_grad,d)) <= (-c(2)*dot(x_grad,d)) )
              f_alpha=alp;
              return
          end

%           if( dot(x_new_grad,d) >= (c(2)*dot(x_grad,d)) )
%               f_alpha=alp;
%               return
%           end
          
          % When debug, we may need them.
%           fprintf("\nLHS3: %f", dot(x_new_grad,d)*(alp2-alp1))
          if dot(x_new_grad,d)*(alp2-alp1) >= 0
              alp2=alp;
          else
              alp1=alp;
          end
     end
     % prevent into endless loop
     % In theory, we won't into endless loop, this command is just in case
     if(abs(alp1-alp2)<0.00001)
         f_alpha=alp1;
         return
     end
     f_alpha=Zoom(alp1, alp2,  c, x, d, f_type, nm);
end

