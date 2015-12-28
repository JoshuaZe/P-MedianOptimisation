%PSO for P-Median
clc;
clear all;
close all;

tic %��ʱʱ����ʼ��

%��ʼ����¼��
global p %�ɽ���ʩ��
global n %��ѡ���
global W %���Ȩ��
global distances %����������
W=load('W.txt');%Ȩ��
distances=load('distances.txt');%����(i to j)
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
p=40  %Ⱦɫ�峤��(��ʩ��)
n=100 %(������)

%�������¼��
%����ƶ�����MaxIter
MaxIter=ceil(n*(p)^(1/2))
%��ʼ����Ⱥ��ģ
d=ceil(n/p);
S=nchoosek(n,p);
popsize=max(2,ceil(n*log(S)/(100*d)))*d
%��ʼ����Ⱥ
k=popsize/d;
%population=initial(n,p,k);
population=initial2(n,p,popsize);
%��ʼ���ƶ��ٶȼ����ߵ�local��globalѧϰ���Ӽ���������
VMAX=3;VMIN=-3;
V=ceil(rands(popsize,p));
clocal=2;
cglobal=2;
inertia_ini=1;
inertia_end=0.4;
%��ʼ������                
Generation=1;
while Generation<MaxIter+1
    %������Ⱥ��Ӧ��
    Fitvalue=fitnessfun(population);
    %��¼����ȫ����ü�������Ӧ�ȼ�ƽ����Ӧ��
    [fworst,nworst]=max(Fitvalue);
    [fbest,nbest]=min(Fitvalue);
    fmean=mean(Fitvalue);
    yworst(Generation)=fworst;
    ybest(Generation)=fbest;
    ymean(Generation)=fmean;
    %��¼������Ѽ����Ⱦɫ�����
    xworst(Generation,:)=population(nworst,:);
    xbest(Generation,:)=population(nbest,:);
    %���¸���Ⱦɫ����ʷ�ֲ���õ���Ӧ�ȼ�Ⱦɫ�弰�ٶȸ���
    if Generation==1
        %�״μ�¼�ֲ����Ž�
        localvalue=Fitvalue;
        localbest=population;
    else
        for i=1:popsize
            if localvalue(i,:)>Fitvalue(i,:)
                localbest(i,:)=population(i,:);
            end
            %�ٶȸ���
            %if xbest(Generation,:)==xbest(Generation-1,:)
            %inertia=5*rand;
            %else
            inertia=(inertia_ini-inertia_end)*(MaxIter-Generation)/...
                MaxIter+inertia_end;
            %end
            V(i,:)=ceil(inertia*V(i,:)+...
                clocal*rand*(localbest(i,:)-population(i,:))+...
                cglobal*rand*(xbest(Generation,:)-population(i,:)));
            V(i,find(V(i,:)>VMAX))=VMAX;
            V(i,find(V(i,:)<VMIN))=VMIN;
            %��Ⱥ����
            population(i,:)=population(i,:)+V(i,:);
            population(i,find(population(i,:)>n))=n;
            population(i,find(population(i,:)<1))=1;
            %for j=1:p
            %   r=population(i,j);
            %    while repeatornot(population(i,:),p,r)
            %       r=ceil(rand*n);
            %    end
            %    population(i,j)=r;
            %end
        end
    end
    Generation=Generation+1;
end
%������ֵ
Generation=Generation-1;

%������Ⱥ��Ӧ��
Fitvalue=fitnessfun(population);
%��¼����ȫ����ü�������Ӧ�ȼ�ƽ����Ӧ��
[fworst,nworst]=max(Fitvalue);
[fbest,nbest]=min(Fitvalue);
fmean=mean(Fitvalue);
yworst(Generation)=fworst;
ybest(Generation)=fbest;
ymean(Generation)=fmean;
%��¼������Ѽ����Ⱦɫ�����
xworst(Generation,:)=population(nworst,:);
xbest(Generation,:)=population(nbest,:);

Bestpopulation=population(nbest,:);
Besttargetfunvalue=targetfun(Bestpopulation)

runningtime=toc %��ʱ��ֹ��

%������Ӧ������
figure(1);
handbest=plot(1:Generation,ybest);
set(handbest,'linestyle','-','linewidth',1.8,'marker','*','markersize',6)
hold on;
handmean=plot(1:Generation,ymean);
set(handmean,'color','r','linestyle','-','linewidth',1.8,'marker','h',...
'markersize',6)
xlabel('��������');ylabel('����(��С)/ƽ����Ӧ��');xlim([1 Generation]);
legend('����(��С)��Ӧ��','ƽ����Ӧ��','Location','NorthEast');
box off;hold off;