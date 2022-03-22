%最速下降法
clear;clc
tic        %tic and toc用来记录时间

%设定一些常数
c1 = 0.0001;
c2 = 0.9;
cc=[c1,c2];
alpha_max=1;

format long g
t=2;       %设置维数
p=2;
A=10*rand(p,t);              %随机生成p*t的矩阵
rank(A)
while(rank(A)<min(p,t))      %生成满秩矩阵
    A=10*rand(p,t);          
end
x=10*rand(t,1);         %随机生成自变量x
b=10*rand(p,1);              
f=fun(A, b, x, 1);           %计算f
f_grad=fun(A, b, x, 2);
d=-f_grad;              %生成方向向量
%Lf=2*norm(A'*A,2);           %计算利普西茨常数
alpha=Algorithm(alpha_max,A,b,cc,x)               %计算步长                
num=0;
while (norm(f_grad)>0.00001)
    alpha=Algorithm(alpha_max,A,b,cc,x)
    x=x+alpha*d;              %更新x
    f_grad=fun(A, b, x, 2);  %更新梯度
    Norm=norm(f_grad)      %更新梯度范数   
    f=fun(A, b, x, 1)     %更新函数值
    d=-f_grad;                     %更新方向向量
    num=num+1                           %迭代轮数加一
end
toc