%selecting the parents(randomly)
function seln=selection(population);
popsize=size(population,1);
%����Ⱥ��ѡ����������
for i=1:2
    r=ceil(rand*popsize);%�����
    if i==2
        while r==seln(1)
            r=ceil(rand*popsize);%�����
        end
    end
    seln(i)=r;%ѡ�и�������
end