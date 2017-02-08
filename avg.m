function [] = avg(file, header, repRate, no_row, no_col,startpt, endpt)   
m = 1;
n = 1;
j =1;
x = file(startpt,1);
y = file(endpt,1);
avgvals = [];
for i=1:2:(size(file,2))
    if (j>repRate)
        j =1;
        n=n+1;
    end
    start = find(file(:,i)==x);
    ending = find(file(:,i) == y);
    yval = file(:,(i+1));
    figure(31);
    set(gcf,'units','normalized','outerposition',[0.01 0.01 .99 .99]);
    avgy = mean(yval(start:ending));
    avgvals = [avgvals avgy];           %enter the average values into an array 
    m = m+1;
    j= j+1;
    if(j>repRate)
        subplot(no_row,no_col,n);
        plot(avgvals);
        loc = strfind(header(n*repRate,1),'(');
        ttle = char(header(n*repRate,1));
        ttle = ttle(1:loc{1}-1);
        xlabel('caps'), ylabel(header(n*repRate,2)), title(ttle,'FontSize',8), grid on;
        %export_fig(sprintf('avg%d.pdf',n));
        avgvals = [];
    end
end
end