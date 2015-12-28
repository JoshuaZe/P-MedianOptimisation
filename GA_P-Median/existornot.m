%judge whether exist or not
%matrix从1到endnum是否有等于check的重复数值
function existornot=existornot(matrix,endnum,check);
existornot=0;
for i=1:endnum
    if matrix(i,:)==check
        repeatornot=1;
        break;
    end
end