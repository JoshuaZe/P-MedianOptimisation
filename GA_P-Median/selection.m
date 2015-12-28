%selecting the parents(randomly)
function seln=selection(population);
popsize=size(population,1);
%从种群中选择两个个体
for i=1:2
    r=ceil(rand*popsize);%随机数
    if i==2
        while r==seln(1)
            r=ceil(rand*popsize);%随机数
        end
    end
    seln(i)=r;%选中个体的序号
end