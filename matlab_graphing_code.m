% A basic guide to using matlab
% you can either write the code in a file like this, ie .m format file, 
% or you can use the command window on the bottom and type individual lines
% of code there. 
% 
% make sure you save the excel file or anyother files you are using the 
% the matlab inside the default matlab directory. for future use I will teach
% you in person how to switch to a different directory. 
clear all;
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
movFolder = '2_8 - W600uL1uto6u_C1pto10p_6V_4M';
input = xlsread('2.8_W600uL1uto6u_C1pto10p_6V_4M.xls');
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
% %% adding headers
% n =1;
% test = [];
% for i=1:2:(size(file,2))
%     test = [test 'time'  header(n,1)];
%     n=n+1;
% end;
%% graphing average voltages 
avgvolt = zeros([repRate 1]); 
for i = vripple_location:2:avgpower_iterations*2
    avgvolt((i+1)/2) =  nanmean(file(:,i+1));
end;
figure;
hold on;
for i = 1:1:6
    plot(avgvolt((1+(10*(i-1))):(10*i)));
    temp{i} = strcat('L=',int2str(i),'e-06');
    xlabel('cap = 1 to 10 pF'), ylabel('avgVoltage(v)'), title('L = 1um to 6um'), grid on;
end;
legend(temp);
hold off;


% figure;
% j = 1; 
% m = 1;
% n=1;
% for i = vripple_location:2:avgpower_iterations*2
%     if j>repRate
%         hold off;
%         figure;
%         m=m+1;
%         j=1
%         n=1;
%     end;
%     hold on;
%     plot(n, nanmean(file(:,i+1)),o-,'linewidth', 2,'.','markersize', 20);
%     xlabel('cap = 1 to 10 pF'), ylabel('avgVoltage'), title(strcat('L = ',int2str(m),'um')), grid on;
%     j= j+1;
%     n=n+1;
% end;


%% Saving the files to pdf 
mkdir(movFolder);
for i = 1:1:get(gcf,'Number')
    h=figure(i);
    set(h,'PaperOrientation','landscape');
   print(h,strcat('figure',num2str(i)),'-dpdf','-fillpage');
   movefile(strcat('figure', num2str(i),'.pdf'),strcat('C:\Users\radra\Box Sync\Senior Fall 2016\ESE 440\',movFolder,'\','figure', num2str(i),'.pdf'));  
   %append_pdfs('testing.pdf',sprintf('avg%d.pdf',i));
end

close all
