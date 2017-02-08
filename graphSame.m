function [] = graphSame(file, header, repRate, no_row, no_col,startpt, endpt)   
m = 1;
n = 1;
j =1;
for i=1:2:(size(file,2))
    if (j>repRate)
        j =1;
        n=n+1;
    end
    xval = file(:,i);
    yval = file(:,(i+1));
    figure(n);
%    set(gcf,'PaperOrientation','landscape');
%    set(gcf,'PaperUnits','normalized');
    set(gcf,'units','normalized','outerposition',[0.01 0.01 .99 .99]);
    %set(gcf,'PaperPosition', [0.05 0.05 .9 .9]);
   
   
    subplot(no_row,no_col,j);
    plot(xval(startpt:1:endpt), yval(startpt:1:endpt));
    xlabel(header(i,2)), ylabel(header(i+1,2)), title(header(m,1),'FontSize',8), grid on;
    %print('-fillpage', '-dpdf', strcat('test',num2str(n),'.pdf'));
    %export_fig(sprintf('test%d.pdf',n));
    
    m = m+1;
    j= j+1;
end
end