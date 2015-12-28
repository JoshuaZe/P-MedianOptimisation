%initializing the population
function population=initial(n,p,k);
d=ceil(n/p);%每个group有d个染色体
%k个group循环初始化
for set=1:k
    temp(1)=1;
    stn=1;%起始数值
    %临时数组temp循环初始化
    for i=1:(n-1)
        if temp(i)+set<=n
            temp(i+1)=temp(i)+set;
        else
            temp(i+1)=stn+1;
        end
    end
    %随机填充空白
    for i=n:d*p
       r=ceil(rand*n);
       %while ~(isempty(find((temp-r)==0))),bad speed
       row=d;
       while repeatornot(temp((1+(row-1)*p):i),i-(row-1)*p,r)
           r=ceil(rand*n);
       end
       temp(i+1)=r; 
    end 
    %将数组值赋值入种群矩阵
    for row=1:d
        population(row+(set-1)*d,:)=temp((1+(row-1)*p):(p+(row-1)*p));
    end
end