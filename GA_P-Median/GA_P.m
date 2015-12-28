%GA for P-Median
clc;
clear all;
close all;

tic %计时时间起始点

%初始参数录入
global p %可建设施数
global n %总选择点
global W %结点权重
global distances %任两点间距离
W=load('W.txt');%权重
distances=load('distances.txt');%距离(i to j)
%%%try Data 12-3%%%
% x=[2,2,29,22,2,67,98,33,25,95,36,31];
% y=[55,91,91,99,70,99,52,6,44,88,36,71];
% k=1;
% for i=1:12
%     for j=i+1:12
%         distances(k)=((x(i)-x(j))^2+(y(i)-y(j))^2)^(1/2);
%         k=k+1;
%     end
% end
%%%try Data 12-3%%%
p=40  %染色体长度(设施数)
n=100 %(需求数)

%程序参数录入
%最大进化代数MaxIter
MaxIter=ceil(n*(p)^(1/2))
%初始化种群规模
d=ceil(n/p);
S=nchoosek(n,p);
popsize=max(2,ceil(n*log(S)/(100*d)))*d
%初始化种群
k=popsize/d;
population=initial(n,p,k);
%计算适应度Fitvalue
Fitvalue=fitnessfun(population);
Generation=1;
while Generation<MaxIter+1
    %选择
    seln=selection(population);
    selns(Generation,:)=seln;
    %交配（交叉）,greedy deletion
    candidate=generation(population,seln);
    candidates(Generation,:)=candidate;
    %优胜替换
    population=replacement(population,Fitvalue,candidate);
    %计算新种群适应度
    Fitvalue=fitnessfun(population);
    
    %记录当代最好及最差的适应度及平均适应度
    [fworst,nworst]=max(Fitvalue);
    [fbest,nbest]=min(Fitvalue);
    fmean=mean(Fitvalue);
    yworst(Generation)=fworst;
    ybest(Generation)=fbest;
    ymean(Generation)=fmean;
    %记录当代最佳及最差染色体个体
    xworst(Generation,:)=population(nworst,:);
    xbest(Generation,:)=population(nbest,:);
    Generation=Generation+1;
end
%求最优值
Generation=Generation-1;
Bestpopulation=population(nbest,:);
Besttargetfunvalue=targetfun(Bestpopulation)

runningtime=toc %计时终止点

%绘制适应度曲线
figure(1);
handbest=plot(1:Generation,ybest);
set(handbest,'linestyle','-','linewidth',1.8,'marker','*','markersize',6)
hold on;
handmean=plot(1:Generation,ymean);
set(handmean,'color','r','linestyle','-','linewidth',1.8,'marker','h',...
'markersize',6)
xlabel('进化代数');ylabel('最优(最小)/平均适应度');xlim([1 Generation]);
legend('最优(最小)适应度','平均适应度','Location','NorthEast');
box off;hold off;