% f_alpha:返回值，即合适的步长
% alp1:区间左端点  alp2:区间右端点  A:方程组系数矩阵
% b:方程组常数  c:包含常数c1、c2  x:当前位置自变量
function f_alpha = Zoom(alp1,alp2,A,b,c,x)
     disp('Using the zoom function')
     alp = (alp1 + alp2) / 2;  %二分法产生alpha
     x_grad=fun(A,b,x,2);      %计算梯度
     d=-x_grad;                %计算方向
     x_new=x+alp*d;            %在alp的步长下找到下一点
     x_new_grad=fun(A,b,x_new,2);  %求出该点梯度
     
     if((fun(A,b,x_new,1) > fun(A,b,x,1)+c(1)*alp*dot(x_grad,d)) || (fun(A,b,x_new,1)>=fun(A,b,x+alp1*d,1)))
         alp2=alp;
     
     else
          if(abs(dot(x_new_grad,d)) <= (-c(2)*dot(x_grad,d)) )
              f_alpha=alp;
              return
          end
          
          if(dot(x_new_grad,d)*(alp2-alp1)>=0)
              alp2=alp1;
          end
          alp1=alp;
     end
     % 防止进入死循环（理论上，在强wolfe条件下不会进入死循环，该命令只是为以防万一）
     if(abs(alp1-alp2)<0.00001)
         f_alpha=alp1;
         return
     end
     f_alpha=Zoom(alp1, alp2,A,b,c,x);
end