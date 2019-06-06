%This program computes the minimum value of a given w, e, b such that Gtft
%can resist invasion by Sneaky (a strategy that plays ATFT with a slightly
%higer error rate using fzero and DiffPayAtftDAlld
%Input values are as follows:
%
%   b = benefit of cooperation
%   t = number of interactions
%   a = prob accurate arbitration
%   e = probability of a C->D implementation error
%
        
wfix= 0.95;
bfix = 3;
incfix = 0.1;

wVal = [.9 .95 .99];
bVal = [2 3 4];
incVal = [0.05,0.5,1];

eVal = 0:0.05:0.5;
maxie = length(eVal);

minAvalW = zeros(3,maxie);
minAvalB = zeros(3,maxie);
minAvalInc = zeros(3,maxie);

b = bfix;
inc = incfix;
for ib = 1:length(wVal)                                                     %iterate over w   
    w = wVal(ib);
    a0 = 0.5;
    for ie = 1:maxie                                                        %iterate over e
        e = eVal(ie);
%         if e+inc > 0.5
%             inc = 0.5;
%         end
        fun = @(a)DiffPayAtftVsAtftIncErr(a,b,w,e,inc);                         % returns the difference in payoff between ATFT and sneaky
        a0 = fzero(fun,a0);
        minAvalW(ib,ie) = a0;                                                % min a value = root of DiffPay
    end
end
    
w = wfix;
inc = incfix;
for ib = 1:length(wVal)                                                     %iterate over w   
    b = bVal(ib);
    a0 = 0.5;
    for ie = 1:maxie                                                        %iterate over e
        e = eVal(ie);
%         if e+inc > 0.5
%             inc = 0.5;
%         end
        fun = @(a)DiffPayAtftVsAtftIncErr(a,b,w,e,inc);                         % returns the difference in payoff between ATFT and sneaky
        a0 = fzero(fun,a0);
        minAvalB(ib,ie) = a0;                                                % min a value = root of DiffPay
    end
end

w = wfix;
b = bfix;
for ib = 1:length(wVal)                                                     %iterate over w   
    inc = incVal(ib);
    a0 = 0.5;
    for ie = 1:maxie                                                        %iterate over e
        e = eVal(ie);
%         if e+inc > 0.5
%             inc = 0.5;
%         end
        fun = @(a)DiffPayAtftVsAtftIncErr(a,b,w,e,inc);                         % returns the difference in payoff between ATFT and sneaky
        a0 = fzero(fun,a0);
        minAvalInc(ib,ie) = a0;                                                % min a value = root of DiffPay
    end
end

subplot(1,3,1)
plot(eVal,minAvalB(1,:),eVal,minAvalB(2,:),eVal,minAvalB(3,:));
title('w = 0.95, inc = 0.1')
xlabel('error rate (e)');
ylabel({'arbitration accuracy (a)'});
axis([0 .5 0 1])
lstr1 = strcat('b = ',num2str(bVal(1)));
lstr2 = strcat('b = ',num2str(bVal(2)));
lstr3 = strcat('b = ',num2str(bVal(3)));
legend(lstr1,lstr2,lstr3);

subplot(1,3,2)
plot(eVal,minAvalW(1,:),eVal,minAvalW(2,:),eVal,minAvalW(3,:));
title('b = 3, inc = 0.1')
xlabel('error rate (e)');
ylabel({'arbitration accuracy (a)'});
axis([0 .5 0 1])
lstr1 = strcat('w = ',num2str(wVal(1)));
lstr2 = strcat('w = ',num2str(wVal(2)));
lstr3 = strcat('w = ',num2str(wVal(3)));
legend(lstr1,lstr2,lstr3);

subplot(1,3,3)
plot(eVal,minAvalInc(1,:),eVal,minAvalInc(2,:),eVal,minAvalInc(3,:));
title('b = 3, w = 0.95')
xlabel('error rate (e)');
ylabel({'arbitration accuracy (a)'});
axis([0 .5 0 1])
lstr1 = strcat('d = ',num2str(incVal(1)));
lstr2 = strcat('d = ',num2str(incVal(2)));
lstr3 = strcat('d = ',num2str(incVal(3)));
legend(lstr1,lstr2,lstr3);



    
