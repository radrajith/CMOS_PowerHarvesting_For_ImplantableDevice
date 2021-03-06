% A basic guide to using matlab
% you can either write the code in a file like this, ie .m format file, 
% or you can use the command window on the bottom and type individual lines
% of code there. 
% 
% make sure you save the excel file or anyother files you are using the 
% the matlab inside the default matlab directory. for future use I will teach
% you in person how to switch to a different directory. 
no_row =4;
no_col =3;
startpt = 164;
endpt = 700;
repRate = 10;        %what is range used - from 2 to 6 volts every .5 = 9 
% To open an excel file you use this command

input = xlsread('varyC1pto10p_W60uL600n_2.5V_2_1.xls');
file = input(7:size(input,1),1:size(input,2));     %removing first 6 rows bcs its junk
[~,~,header] = xlsread('header.xls');       %copy all the strings in the file

var = (size(file,2)/2)/repRate;     %number of variables to graph
%%%%
%graphDiff(file, header, repRate, no_row, no_col, startpt, endpt);
%graphSame(file, header, repRate, no_row, no_col,startpt, endpt);
powercalc(file, header, repRate, no_row, no_col,startpt, endpt);
for i = 1:1: var
    %print(figure(i),strcat('test',num2str(i)),'pdf');
    %append_pdfs('testing.pdf',sprintf('avg%d.pdf',i));
end
%adding headers
n =1;
test = [];
for i=1:2:(size(file,2))
    test = [test 'time'  header(n,1)];
    n=n+1;
end;
    
%%%%    power calcualtion
%{
coilV = 1*repRate; 
vrect = 2*repRate;
cur = 5*repRate;
xval = file(:,1);
fSize = size(file,2);
power = [];
 n = 1;
for x = 1: 2: repRate*2
    voltage = file(:,x+(coilV*2+1)) - file(:,x+(vrect*2)+1);
    current = file(:,(x+(cur*2)+1));
    disp(x+(coilV*2+1)); disp(x+(vrect*2)+1); disp((x+(cur*2)+1));
    yval = voltage.*current;
    power = [power yval];
    figure(20);
    subplot(no_row,no_col, n);
    
    plot(xval(startpt:1:endpt), yval(startpt:1:endpt));
    xlabel('time'), ylabel('power'), title(header(n,3)), grid on;
    n=n+1;
end
end

%figure(20);
    %subplot(no_row,no_col,16);
 %   plot(xval(startpt:1:endpt), p(startpt:1:endpt));
 %   xlabel('time'), ylabel('power'), title('power at 2.5'), grid on;
%}

