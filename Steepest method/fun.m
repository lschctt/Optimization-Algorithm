% result:������
% A:������ϵ������  b:�����鳣��  xx:��ǰλ���Ա���
% ii:ѡ���������ͣ�ii=1ʱ���㵱ǰ����ֵ��ii=����ʱ���㵱ǰ�ݶ�
function result = fun(A, b, xx, ii)
    if(ii==1)
        result=(norm(A*xx-b))^2;
    else
        result=2*A'*(A*xx-b);
    end
end