%replacement operator
function popnew=replacement(population,Fitvalue,candidate);
%��popsize������
popsize=size(population,1);
%���㵥��Ⱦɫ��candidate����Ӧ����ֵ
candidatevalue=targetfun(candidate);
if (~(candidatevalue>max(Fitvalue)))&...
    (~existornot(population,popsize,candidatevalue))
    %population������Ⱦɫ�����飬ȡ��С���
    worstninpop=min(find(Fitvalue==max(Fitvalue)));
    %�������滻��
    population(worstninpop,:)=candidate;
end
popnew=population;