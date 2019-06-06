%This program computes the maximum value of g given w, e, b for GTFT to
%resist invasion by 
% using fzero and DiffPayAtftDAlld

clear
clc

bVal = [1.5 2 3];
c=1;
a=.8;

niter = 10000;
w=.95;
eVal = 0:0.05:0.5;
maxie = length(eVal);

maxGval = zeros(3,maxie);
EPayGTFT = zeros(3,maxie);
VarPayGTFT = zeros(3,maxie);
ExPayAtft = zeros(3,maxie);


for ib = 1:length(bVal)
    g0=0.5;
    b = bVal(ib);
    for ie = 1:maxie
        e = eVal(ie);
        if DiffPayGTFTVsAllD(0,b,w,e)<= 0
            g0 = 0;
        elseif DiffPayGTFTVsAllD(1,b,w,e) > 0
            g0 = 1;
        else
            fun = @(g)DiffPayGTFTVsAllD(g,b,w,e);                           % parameterized function
            g0 = fzero(fun,g0);
        end
        maxGval(ib,ie) = g0;
        for i = 1:niter
            t = geornd(1-w) + 1;
            ThisPayGTFT = EpayGTFTVsGTFT(b,t,g0,e);
            EPayGTFT(ib,ie) = EPayGTFT(ib,ie) + ThisPayGTFT;
            VarPayGTFT(ib,ie) = VarPayGTFT(ib,ie) + ThisPayGTFT*ThisPayGTFT;
        end
        ExPayAtft(ib,ie) = -a^2*b*e.^3*w + a^2*b*e.^2*w + a^2*c*e.^3*w - a^2*c*e.^2*w + a*b*e.^3*w - a*b*e.^2*w - a*c*e.^3*w + a*c*e.^2*w - b*e.^3*w + b*e.^2*w + b*e - b + c*e.^3*w - c*e.^2*w - c*e+c;
        ExPayAtft(ib,ie) = -ExPayAtft(ib,ie)./(2*a^2*e.^2*w^2 - 2*a^2*e.^2*w - 2*a*e.^2*w^2 + 2*a*e.^2*w + 2*e.^2*w^2 - 2*e.^2*w - e*w^2 + e*w - w +1);

    end
end

EPayGTFT = EPayGTFT/niter;
VarPayGTFT = VarPayGTFT/niter - EPayGTFT.*EPayGTFT;
S = sqrt(VarPayGTFT)/sqrt(niter);



subplot(1,3,1)
plot(eVal,ExPayAtft(1,:))
title('b = 2, w = 0.95')
hold on
errorbar(eVal,EPayGTFT(1,:),2*S(1,:))
axis([0 0.5 0 40])
xlabel('error rate (e)')
ylabel('payoff')
legend('V(ATFT|ATFT','V(WSLS|WSLS')
hold off

subplot(1,3,2)
plot(eVal,ExPayAtft(2,:))
title('b = 3, w = 0.95')
hold on
errorbar(eVal,EPayGTFT(2,:),2*S(2,:))
axis([0 0.5 0 40])
xlabel('error rate (e)')
ylabel('payoff')
legend('V(ATFT|ATFT','V(WSLS|WSLS')
hold off

subplot(1,3,3)
plot(eVal,ExPayAtft(3,:))
title('b = 4, w = 0.95')
hold on
errorbar(eVal,EPayGTFT(3,:),2*S(3,:))
axis([0 0.5 0 40])
xlabel('error rate (e)')
ylabel('payoff')
legend('V(ATFT|ATFT','V(WSLS|WSLS')
hold off




    
