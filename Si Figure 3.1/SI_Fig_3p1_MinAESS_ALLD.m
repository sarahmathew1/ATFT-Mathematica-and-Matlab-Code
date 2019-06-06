%This program computes the minimum value of a given w, e, b for ATFT to
%resist invasion by ALLD using fzero and DiffPayAtftDAlld

wFix = .95;                                                                 %baseline values of w, b/c
bFix = 3;


eVal = 0:0.05:0.5;                                                          %varying value of e, w, b
wVal = [.9 .95 .99];
bVal = [2 3 4];
maxie = length(eVal);

minAvalW = zeros(3,maxie);                                                  %initialize vectors of results
minAvalB = zeros(3,maxie);

for iw = 1:length(wVal)                                                     % w varies, b set at baseline
    w = wVal(iw);
    b = bFix;
    a0 = 0.5;                                                               %initial value of a for fzero
    for ie = 1:maxie
        e = eVal(ie);
        fun = @(a)DiffPayAtftDAlld(a,b,w,e);                                % difference in payoff as a fn of a
        a0 = fzero(fun,a0);
        minAvalW(iw,ie) = a0;                                               % minimum value of a when diff payoff  = 0
    end
end

for ib = 1:length(bVal)                                                     %b varies, w at baseline
    w = wFix;
    b = bVal(ib);
    a0 = 0.5;                                                               %initial value of a for fzero
    for ie = 1:maxie
        e = eVal(ie);
        fun = @(a)DiffPayAtftDAlld(a,b,w,e);                                %difference in payoff as a fn of a
        a0 = fzero(fun,a0);
        minAvalB(ib,ie) = a0;                                               % minimum value of a when diff payoff  = 0
    end
end
    
subplot(1,2,1)
plot(eVal,minAvalW(1,:),eVal,minAvalW(2,:),eVal,minAvalW(3,:));
title(' b = 3');
xlabel('error rate (e)');
ylabel('max error rate ATFT resist invasion by ALLD');
axis([0 0.5, 0 1])
lstr1 = strcat('w = ',num2str(wVal(1)));
lstr2 = strcat('w = ',num2str(wVal(2)));
lstr3 = strcat('w = ',num2str(wVal(3)));
legend(lstr1,lstr2,lstr3);

subplot(1,2,2)
plot(eVal,minAvalB(1,:),eVal,minAvalB(2,:),eVal,minAvalB(3,:));
title('w = 0.95');
xlabel('error rate (e)');
ylabel('max error rate ATFT resistinvasion by ALLD');
axis([0 0.5, 0 1])
lstr1 = strcat('b = ',num2str(bVal(1)));
lstr2 = strcat('b = ',num2str(bVal(2)));
lstr3 = strcat('b = ',num2str(bVal(3)));
legend(lstr1,lstr2,lstr3);
    
