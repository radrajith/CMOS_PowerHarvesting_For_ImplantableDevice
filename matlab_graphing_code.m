% A basic guide to using matlab
% you can either write the code in a file like this, ie .m format file, 
% or you can use the command window on the bottom and type individual lines
% of code there. 
% 
% make sure you save the excel file or anyother files you are using the 
% the matlab inside the default matlab directory. for future use I will teach
% you in person how to switch to a different directory. 
%% change these settings
vripple_location = 1;
no_row =4;
no_col =3;
startpt = 6000;
endpt = 8000;
avgpower_iterations = 60;   %when doing a lot of power calc, then this values will help generate multiple figures
repRate = 10;   %what is range used - from 2 to 6 volts every .5 = 9 
%%
% To open an excel file you use this command

input = xlsread('2.7_W600uL1uto6u_C1pto10p_2.5V_4M.xls');
file = input(7:size(input,1),1:size(input,2));     %removing first 6 rows bcs its junk
[~,~,header] = xlsread('header.xls');       %copy all the strings in the file

var = (size(file,2)/2)/repRate;     %number of variables to graph
%%%%
%graphDiff(file, header, repRate, no_row, no_col, startpt, endpt);
vripple = ripple(file,vripple_location, header,avgpower_iterations, startpt, endpt);
graphSame(file, header, repRate, no_row, no_col,startpt, endpt);
powercalc(file, header, repRate, no_row, no_col,startpt, endpt, avgpower_iterations);

%% 
figure;
hold on;
for i = 1:1:6
    plot(vripple((1+(10*(i-1))):(10*i)));
    temp{i} = strcat('L=',int2str(i),'e-06');
    xlabel('cap = 1 to 10 pF'), ylabel('Vripple'), title('L = 1um to 6um'), grid on;
end;
legend(temp);
hold off;
%% adding headers
n =1;
test = [];
for i=1:2:(size(file,2))
    test = [test 'time'  header(n,1)];
    n=n+1;
end;
    

%% Saving the files to pdf 
%for i = 1:1: 
%    print(figure(i),strcat('test',num2str(i)),'pdf');
%    append_pdfs('testing.pdf',sprintf('avg%d.pdf',i));
%end
