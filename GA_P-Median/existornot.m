%judge whether exist or not
%matrix��1��endnum�Ƿ��е���check���ظ���ֵ
function existornot=existornot(matrix,endnum,check);
existornot=0;
for i=1:endnum
    if matrix(i,:)==check
        repeatornot=1;
        break;
    end
end