function vripple = ripple(file, vripple_location, header, repRate,startpt, endpt)   
m = 1;
vripple = zeros([repRate 1]);
for i=1:2:(2*vripple_location*repRate)
   
    yval = file(:,(i+1));  
    vripple(m) = max(yval(startpt:1:endpt))-min(yval(startpt:1:endpt));
    %xlabel(header(i,2)), ylabel(header(i+1,2)), title(header(m,1),'FontSize',8), grid on;
 
    m = m+1;
end
end