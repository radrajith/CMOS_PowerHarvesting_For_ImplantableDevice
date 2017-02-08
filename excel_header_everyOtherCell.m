[~,~,header] = xlsread('header.xls'); 
n=1;
temp = header(1:300,1);
for i=1:1:200
    temp(n) = header(i,1);
    temp(n+1) = {''};
    n=n+2;
end;
xlswrite('header.xls',temp,'I:I');