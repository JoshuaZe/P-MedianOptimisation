function population=initial(n,p,popsize);
%initializing the population
for i=1:popsize
    for j=1:p
       r=ceil(rand*n);
       population(i,j)=r;
       while repeatornot(population(i,:),j,r)
           r=ceil(rand*n);
       end
       population(i,j)=r; 
    end
end