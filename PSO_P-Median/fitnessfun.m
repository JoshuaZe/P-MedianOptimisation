%Fitness Function
function Fitvalue=fitnessfun(population);
%有popsize个个体
popsize=size(population,1);
for i=1:popsize
    x=population(i,:);
    %计算适应度函数值
    Fitvalue(i)=targetfun(x);
end
Fitvalue=Fitvalue';