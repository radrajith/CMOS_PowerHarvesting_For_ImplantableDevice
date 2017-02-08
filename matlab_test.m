% A basic guide to using matlab
% you can either write the code in a file like this, ie .m format file, 
% or you can use the command window on the bottom and type individual lines
% of code there. 
% 
% make sure you save the excel file or anyother files you are using the 
% the matlab inside the default matlab directory. for future use I will teach
% you in person how to switch to a different directory. 
startpt = 1;
endpt = 100;
period = 100E-6;
% To open an excel file you use this command

file = xlsread('RECTIFIED_3V.xls');

% now the variable file contains all the contents from inside the file
% after you run the codem you can check contents of any variable by going 
% to the workspace window on the side. 

% 
% essentially the variable file is a array in our case the variable 
% is 15539x14 array. 

%%coil voltage difference
vsin_x = file(:,3);                         %copy the values in (all rows, 3rd column) from file variable, the colon ':' is used select all the rows/columns
%vsin_x = vsin_x(8:size(vsin_x));            %since the first 8 values are useless in the excel file, we copy from 8th row to end of the row
vsin_y = file(:,4);
%vsin_y = vsin_y(8:size(vsin_y));
figure;
subplot(3,3,5);
plot(vsin_x(startpt:1:endpt), vsin_y(startpt:1:endpt));         %vsin_x(8:1:100) - plots from 3rd value to 100th value, in the intervals of 1
xlabel('time(us)'), ylabel('voltage'), title('coil voltage(difference)'), grid on;


%%current at v1 puls at(v=3)
v1_x = file(:,1);                         %copy the values in (all rows, 3rd column) from file variable, the colon ':' is used select all the rows/columns
%vsin_x = vsin_x(8:size(vsin_x));            %since the first 8 values are useless in the excel file, we copy from 8th row to end of the row
v1_y = file(:,2);
%vsin_y = vsin_y(8:size(vsin_y));
subplot(3,3,2);
plot(v1_x(startpt:1:endpt), v1_y(startpt:1:endpt));         %vsin_x(8:1:100) - plots from 3rd value to 100th value, in the intervals of 1
xlabel('time(us)'), ylabel('current(A)'), title('current at v1+ at v=3'), grid on;

%%current at M1 Source at(v=3)
m1s_x = file(:,5);                         %copy the values in (all rows, 3rd column) from file variable, the colon ':' is used select all the rows/columns
%vsin_x = vsin_x(8:size(vsin_x));            %since the first 8 values are useless in the excel file, we copy from 8th row to end of the row
m1s_y = file(:,6);
%vsin_y = vsin_y(8:size(vsin_y));
subplot(3,3,3);
plot(m1s_x(startpt:1:endpt), m1s_y(startpt:1:endpt));         
xlabel('time(us)'), ylabel('current(A)'), title('M1 source current at v=3'), grid on;


%%current at v0 plus at(v=3)
v0_x = file(:,7);                         %copy the values in (all rows, 3rd column) from file variable, the colon ':' is used select all the rows/columns
%vsin_x = vsin_x(8:size(vsin_x));            %since the first 8 values are useless in the excel file, we copy from 8th row to end of the row
v0_y = file(:,8);
%vsin_y = vsin_y(8:size(vsin_y));
subplot(3,3,4);
plot(v0_x(startpt:1:endpt), v0_y(startpt:1:endpt));         %vsin_x(8:1:100) - plots from 3rd value to 100th value, in the intervals of 1
xlabel('time(us)'), ylabel('current(A)'), title('current at v0+ at v=3'), grid on;


%%current after rectification at(v=3)
rect_x = file(:,9);                         %copy the values in (all rows, 3rd column) from file variable, the colon ':' is used select all the rows/columns
%vsin_x = vsin_x(8:size(vsin_x));            %since the first 8 values are useless in the excel file, we copy from 8th row to end of the row
rect_y = file(:,10);
%vsin_y = vsin_y(8:size(vsin_y));
subplot(3,3,1);
plot(rect_x(startpt:1:endpt), rect_y(startpt:1:endpt));         %vsin_x(8:1:100) - plots from 3rd value to 100th value, in the intervals of 1
xlabel('time(us)'), ylabel('current(A)'), title('current after rectified at v=3'), grid on;


%%coil+ at(v=3)
coilp_x = file(:,11);                         %copy the values in (all rows, 3rd column) from file variable, the colon ':' is used select all the rows/columns
%vsin_x = vsin_x(8:size(vsin_x));            %since the first 8 values are useless in the excel file, we copy from 8th row to end of the row
coilp_y = file(:,12);
%vsin_y = vsin_y(8:size(vsin_y));
subplot(3,3,6);
plot(coilp_x(startpt:1:endpt), coilp_y(startpt:1:endpt));         %vsin_x(8:1:100) - plots from 3rd value to 100th value, in the intervals of 1
xlabel('time(us)'), ylabel('voltage'), title('coil+ at v=3'), grid on;

%%coil- puls at(v=3)
coilm_x = file(:,13);                         %copy the values in (all rows, 3rd column) from file variable, the colon ':' is used select all the rows/columns
%vsin_x = vsin_x(8:size(vsin_x));            %since the first 8 values are useless in the excel file, we copy from 8th row to end of the row
coilm_y = file(:,14);
%vsin_y = vsin_y(8:size(vsin_y));
subplot(3,3,7);
plot(coilm_x(startpt:1:endpt), coilm_y(startpt:1:endpt));         %vsin_x(8:1:100) - plots from 3rd value to 100th value, in the intervals of 1
xlabel('time(us)'), ylabel('voltage'), title('coil- at v=3'), grid on;


