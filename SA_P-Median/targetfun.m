%target function
%x is one of the members with many genes(x��Ⱦɫ��)
function y=targetfun(x);
global p %�ɽ���ʩ��
global n %��ѡ���
global W %���Ȩ��
global distances %����������
%¼��distances�����Dij
k=1;
for i=1:n
    for j=i:n
        if i==j
            Dij(i,j)=0;
        else
            Dij(i,j)=distances(k);
            Dij(j,i)=distances(k);
            k=k+1;
        end
    end
end
%core
%����dij*xij=DXij=the minmum between the point(n-p) and point(p)�������y
y=0;
for i=1:n
    DXij(i)=Dij(i,x(1));
    %%n2p(i)=x(1);
    for j=2:p
        %%����û�����ģ���е�x(i��j)��������Ϊ������Ʒ�����
        %%if DXij(i)>Dij(i,x(j))
        %%n2p(i)=x(j);
        %%end
        DXij(i)=min(DXij(i),Dij(i,x(j)));
    end
    y=y+W(i)*DXij(i);
end