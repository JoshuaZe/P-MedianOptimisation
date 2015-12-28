%target function
%x is one of the members with many genes(x是染色体)
function y=targetfun(x);
global p %可建设施数
global n %总选择点
global W %结点权重
global distances %任两点间距离
%录入distances入矩阵Dij
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
%计算dij*xij=DXij=the minmum between the point(n-p) and point(p)，并求解y
y=0;
for i=1:n
    DXij(i)=Dij(i,x(1));
    %%n2p(i)=x(1);
    for j=2:p
        %%这里没有求出模型中的x(i，j)，但可作为附带产品计算出
        %%if DXij(i)>Dij(i,x(j))
        %%n2p(i)=x(j);
        %%end
        DXij(i)=min(DXij(i),Dij(i,x(j)));
    end
    y=y+W(i)*DXij(i);
end