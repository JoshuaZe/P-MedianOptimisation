function closeness =lattice(matrix_all);
%计算格贴近度3:Lattice closeness degree
matrix_all=matrix_all/100;
Anum=size(matrix_all,2);
Qnum=size(matrix_all,1)-1;
for i = 1:Qnum
    d=0;
    for j = 1:Anum
        d=d+(matrix_all(1,j)-matrix_all(i+1,j))^2;
    end
    closeness(i)=1-(d/Anum)^(1/2);
end
closeness=closeness';
plot (closeness, 'DisplayName', 'closeness', 'YDataSource', 'closeness'); 
figure(gcf)