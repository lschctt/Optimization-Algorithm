% result:计算结果
% A:方程组系数矩阵  b:方程组常数  xx:当前位置自变量
% ii:选择计算的类型，ii=1时计算当前函数值，ii=其他时计算当前梯度
function result = fun(A, b, xx, ii)
    if(ii==1)
        result=(norm(A*xx-b))^2;
    else
        result=2*A'*(A*xx-b);
    end
end