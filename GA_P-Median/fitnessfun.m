%Fitness Function
function Fitvalue=fitnessfun(population);
%��popsize������
popsize=size(population,1);
for i=1:popsize
    x=population(i,:);
    %������Ӧ�Ⱥ���ֵ
    Fitvalue(i)=targetfun(x);
end
Fitvalue=Fitvalue';