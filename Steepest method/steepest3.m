%�����½���
clear;clc
tic        %tic and toc������¼ʱ��

%�趨һЩ����
c1 = 0.0001;
c2 = 0.9;
cc=[c1,c2];
alpha_max=1;

format long g
t=2;       %����ά��
p=2;
A=10*rand(p,t);              %�������p*t�ľ���
rank(A)
while(rank(A)<min(p,t))      %�������Ⱦ���
    A=10*rand(p,t);          
end
x=10*rand(t,1);         %��������Ա���x
b=10*rand(p,1);              
f=fun(A, b, x, 1);           %����f
f_grad=fun(A, b, x, 2);
d=-f_grad;              %���ɷ�������
%Lf=2*norm(A'*A,2);           %�����������ĳ���
alpha=Algorithm(alpha_max,A,b,cc,x)               %���㲽��                
num=0;
while (norm(f_grad)>0.00001)
    alpha=Algorithm(alpha_max,A,b,cc,x)
    x=x+alpha*d;              %����x
    f_grad=fun(A, b, x, 2);  %�����ݶ�
    Norm=norm(f_grad)      %�����ݶȷ���   
    f=fun(A, b, x, 1)     %���º���ֵ
    d=-f_grad;                     %���·�������
    num=num+1                           %����������һ
end
toc