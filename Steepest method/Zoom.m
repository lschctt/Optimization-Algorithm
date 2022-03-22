% f_alpha:����ֵ�������ʵĲ���
% alp1:������˵�  alp2:�����Ҷ˵�  A:������ϵ������
% b:�����鳣��  c:��������c1��c2  x:��ǰλ���Ա���
function f_alpha = Zoom(alp1,alp2,A,b,c,x)
     disp('Using the zoom function')
     alp = (alp1 + alp2) / 2;  %���ַ�����alpha
     x_grad=fun(A,b,x,2);      %�����ݶ�
     d=-x_grad;                %���㷽��
     x_new=x+alp*d;            %��alp�Ĳ������ҵ���һ��
     x_new_grad=fun(A,b,x_new,2);  %����õ��ݶ�
     
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
     % ��ֹ������ѭ���������ϣ���ǿwolfe�����²��������ѭ����������ֻ��Ϊ�Է���һ��
     if(abs(alp1-alp2)<0.00001)
         f_alpha=alp1;
         return
     end
     f_alpha=Zoom(alp1, alp2,A,b,c,x);
end