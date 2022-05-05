%%            Compute f(x) or the gradient of f(x)
%% include:Rosenbrock function, Freudenstein and Roth function, 
%          Powell singular function, Trigonometric function
%% *************************************************************
%% Introduction of Parameters:
%  Output: result: the calculation result
%  input:  xx:current x  f_type:choose type of functions 
%          ii: 1:compute f(x)  2:compute the gradient of f(x) 
%          nm:nm(1) is dimension of x, nm(2) is dimension of f
%% *************************************************************
function result = fun(xx, ii, f_type, nm)
    % if f_type==1, we choose Extend Rosenbrock function
    n = nm(1);
    m = nm(2);
    if f_type == 1
        f = zeros(n,1);
        f(1:2:n-1) = 10*( xx(2:2:n) - xx(1:2:n-1).^2);
        f(2:2:n) = 1 - xx(1:2:n-1);
        
        if ii == 1
            result = sum(f.^2);
        elseif ii == 2
            grad = zeros(n,1);
            grad(1:2:n-1) = -2.*f(1:2:n-1).*20.*xx(1:2:n-1) - 2.*f(2:2:n);
            grad(2:2:n) = 2*f(1:2:n-1)*10;
            result = grad;
        else
            H = zeros(n,n);
            for i = 1:n-1
                if mod(i,2)==1
                    H(i,i) = -40*f(i)+800*xx(i)^2+2;
                    H(i,i+1) = -400*xx(i);
                    H(i+1,i) = H(i,i+1);
                else
                    H(i,i) = 200;
                end
            end

            if mod(n,2)==1
                H(n,n) = -40*f(n)+80*xx(n)^2+2;
            else
                H(n,n) = 200;
            end
            result = H;
        end
    end

    % if f_type==2, we choose Freudenstein and Roth function
    if f_type == 2
        f1 = (-13+xx(1)+((5-xx(2))*xx(2)-2)*xx(2));
        f2 = (-29+xx(1)+((xx(2)+1)*xx(2)-14)*xx(2));
        if ii == 1
            result = f1^2 + f2^2;
        else 
            result = [2*f1+2*f2 ;
                      2*f1*(10*xx(2)-3*xx(2)^2-2)+2*f2*(3*xx(2)^2+2*xx(2)-14)];
        end
    end

    % if f_type==3, we choose Powell singular function
    if f_type == 3
        f1 = xx(1) + 10*xx(2);
        f2 = (5^0.5)*(xx(3)-xx(4));
        f3 = (xx(2) - 2*xx(3))^2;
        f4 = (10^0.5)*(xx(1)-xx(4))^2;
        if ii == 1
            result = f1^2 + f2^2 + f3^2 + f4^2;
        else
            result = [2*f1+2*f4*2*(10^0.5)*(xx(1)-xx(4));
                      2*f1*10+2*f3*2*(xx(2)-2*xx(3));
                      2*f2*(5^0.5)-2*f3*2*(xx(2)-2*xx(3))*2;
                      -2*f2*(5^0.5)-2*f4*2*(10^0.5)*(xx(1)-xx(4))];
        end
    end

    % if f_type==4, we choose Trigonometric function
    if f_type == 4
        sum_cos = 0;
        for j = 1:n
            sum_cos = sum_cos + cos(xx(j));
        end
        f = n+1-cos(xx(1))-sin(xx(1))- sum_cos;
        for i = 2:n
            f = [f, n+i*(1-cos(xx(i)))-sin(xx(i))- sum_cos];
        end

        if ii == 1
            result = norm(f)^2;
        else
            sum_f = sum(f);
            g = 2*(sin(xx(1))-cos(xx(1)))*f(1)+2*sin(xx(1))*sum_f;
            for i = 2:n
                g = [g;2*(i*sin(xx(i))-cos(xx(i)))*f(i)+2*sin(xx(i))*sum_f];
            end
            result = g;
        end
    end

end