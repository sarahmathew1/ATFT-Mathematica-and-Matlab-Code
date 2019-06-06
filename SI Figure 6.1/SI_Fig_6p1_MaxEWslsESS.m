%This program computes the maximum value of e at which WSLS is an ESS against ALLD given w and b
% using fzero and DiffPayWslsAllD

wVal = [.9 .95 .99];
bVal = 2:.2:4;
maxie = length(bVal);

maxEval = zeros(3,maxie);

for iw = 1:length(wVal)
    w = wVal(iw);
    for ib = 1:maxie
        b = bVal(ib);
        if DiffPayWslsAlld(b,w,0)<= 0
            e = 0;
        elseif DiffPayWslsAlld(b,w,.5) >= 0
            e = .5;
        else
            fun = @(e)DiffPayWslsAlld(b,w,e);                           % parameterized function
            e = fzero(fun,[0 0.5]);
        end
        maxEval(iw,ib) = e;
    end
end
    
plot(bVal,maxEval(1,:),bVal,maxEval(2,:),bVal,maxEval(3,:));
xlabel('benefit cost ratio (b/c)');
ylabel('max error rate WSLS resist invation by ALLD');
lstr1 = strcat('w = ',num2str(wVal(1)));
lstr2 = strcat('w = ',num2str(wVal(2)));
lstr3 = strcat('w = ',num2str(wVal(3)));
legend(lstr1,lstr2,lstr3);


    
