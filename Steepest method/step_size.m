%设定一些常数
c1 = 0.0001;
c2 = 0.9;
cc=[c1,c2];
alpha_max=1;

r = 3;  % rows of matrix
c = 3;  % cols of matrix

A=rand(r,c);  % 生成r*c随机系数矩阵
b=rand(r,1);  % 生成r行随机常数列向量
x=rand(c,1);  % 生成随机自变量

Step=Algorithm(alpha_max,A,b,cc,x)