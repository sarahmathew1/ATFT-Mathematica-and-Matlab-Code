%This program computes the maximum value of g given w, e, b for GTFT to
%resist invasion by Alld using fzero and DiffPayAtftDAlld
% 
% w = continuation probability
% g = probability of defection after a defection
% bVal = array of benfit cost ratios
% eVal = array of error rates

w = .95;

bVal = [1.5 2 3];
eVal = 0:0.02:0.5;
maxie = length(eVal);

maxGval = zeros(3,maxie);
g0 = .3;                                                                    

for ib = 1:length(bVal)
    b = bVal(ib);
    for ie = 1:maxie
        e = eVal(ie);
        if DiffPayGTFTVsAllD(0,b,w,e)<= 0
            g0 = 0;
        elseif DiffPayGTFTVsAllD(1,b,w,e) > 0
            g0 = 1;
        else
            fun = @(g)DiffPayGTFTVsAllD(g,b,w,e);                           % anonymous parameterized function of g
            g0 = fzero(fun,g0);                                             % g0 = root of DiffPayGTFTvsAllD
        end
        maxGval(ib,ie) = g0;
    end
end
    
plot(eVal,maxGval(1,:),eVal,maxGval(2,:),eVal,maxGval(3,:));
axis([0 .5 0 1]);
xlabel('error rate (e)');
ylabel('maximum forgivenss GTFT resist invation by ALLD (g*)');
lstr1 = strcat('b = ',num2str(bVal(1)));
lstr2 = strcat('b = ',num2str(bVal(2)));
lstr3 = strcat('b = ',num2str(bVal(3)));
legend(lstr1,lstr2,lstr3);


    
