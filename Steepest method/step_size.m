%�趨һЩ����
c1 = 0.0001;
c2 = 0.9;
cc=[c1,c2];
alpha_max=1;

r = 3;  % rows of matrix
c = 3;  % cols of matrix

A=rand(r,c);  % ����r*c���ϵ������
b=rand(r,1);  % ����r���������������
x=rand(c,1);  % ��������Ա���

Step=Algorithm(alpha_max,A,b,cc,x)