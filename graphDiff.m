function [] = graphDiff(file, header, repRate, no_row, no_col, startpt, endpt)

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
    figure(j);
   %set(gcf,'units','normalized','outerposition',[0 0 1 1]);
    subplot(no_row,no_col,n);
    plot(xval(startpt:1:endpt), yval(startpt:1:endpt));
    xlabel(header(i,2)), ylabel(header(i+1,2)), title(header(m,1)), grid on;
    m = m+1;
    j=j+1;
    %n= n+1;
end
end