%replacement operator
function popnew=replacement(population,Fitvalue,candidate);
%有popsize个个体
popsize=size(population,1);
%计算单个染色体candidate的适应度数值
candidatevalue=targetfun(candidate);
if (~(candidatevalue>max(Fitvalue)))&...
    (~existornot(population,popsize,candidatevalue))
    %population中最差的染色体数组，取最小编号
    worstninpop=min(find(Fitvalue==max(Fitvalue)));
    %将最差的替换掉
    population(worstninpop,:)=candidate;
end
popnew=population;