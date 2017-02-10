function [] = powercalc(file, header, repRate, no_row, no_col,startpt, endpt, avgpower_iterations)
%% change these settings
coilV = (1-1)*repRate*2;        %for power of 1 mosfet we subtract coiv -rect
vrect = (1-1)*repRate*2;
cur = (2-1)*repRate*2;
%% 
power = zeros([repRate 1]);     %storing all the avg power calc
variable = zeros([repRate 1]);  %storing all the variable values like c=1e-12
m = get(gcf,'Number')+1;
j = 1;
n=1;
for x = 1: 2: avgpower_iterations*2
    if (j>repRate)
        j =1;
        m=m+1;
    end
    figure(m);
    xval = file(:,x+(vrect));           
    fSize = size(file(:,x+(coilV)),2);           %size of file
    voltage = file(:,(x+(vrect)+1));% - file(:,(x+(coilV)+1));  
    current = file(:,(x+(cur)+1));
    %disp(x+(coilV+1)); 
    %disp(x+(vrect)+1); disp((x+(cur)+1));
    yval = voltage.*current;
    %% average power calculation
    avgpow = mean(yval(startpt:endpt));       %for avg power calc
    %avgpow = trapz(xval(startpt:1:endpt), yval(startpt:1:endpt))/(xval(endpt) - xval(startpt));
    power(n) = avgpow;
    
    %% 
    %figure(20);
    subplot(no_row,no_col, j);
    loc = strfind(header(n,1),'(');
    ttle = char(header(n,1));
    ttle = ttle(loc{1}:size(ttle,2));
    %% obtain variable values (c = 1e-12), obtian 1e-12
    varst = strfind(ttle,'(');
    %var = ttle(varst+1:size(ttle,2)-1);
    var = ttle(varst(1)+1:size(ttle,2)-1);     %when having multiple variable simulated
    %variable(n) = str2num(var); 
    
    %%
    ttle = strcat(ttle, ' [avg power = ', num2str(avgpow), ' W]' );      %avg power display
    plot(xval(startpt:1:endpt), yval(startpt:1:endpt));
    xlabel('time'), ylabel('Power'), title(ttle,'FontSize',8), grid on;
    n=n+1;
    j=j+1;
end
%% plotting avg power vs capacitance
%figure(21);
%plot(variable,power,'-s');xlabel('Capacitance(f)'), ylabel('avgPower(W)'), title('AvgPower vs Capacitance','FontSize',8), grid on;

end

%figure(20);
    %subplot(no_row,no_col,16);
 %   plot(xval(startpt:1:endpt), p(startpt:1:endpt));
 %   xlabel('time'), ylabel('power'), title('power at 2.5'), grid on;