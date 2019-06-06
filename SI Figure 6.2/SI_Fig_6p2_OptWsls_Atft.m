%This program computes the maximum value of g given w, e, b for WSLS to
%resist invasion by 
% using fzero and DiffPayAtftDAlld

clear
clc

b = 3;
c=1;
a=.8;

niter = 50000;
w=.95;
eVal = 0:0.05:0.5;
bVal = [2 3 4];
maxie = length(eVal);

maxGval = zeros(3,maxie);
EPayWSLS = zeros(3,maxie);
VarPayWSLS = zeros(3,maxie);
ExPayAtft = zeros(3,maxie);



for ib = 1:3
    for ie = 1:maxie
        b = bVal(ib);
        e = eVal(ie);
        for i = 1:niter
            t = geornd(1-w) + 1;
            ThisPayWSLS= EpayWSLSVsWSLS(b,t,e);
            EPayWSLS(ib,ie) = EPayWSLS(ib,ie) + ThisPayWSLS;
            VarPayWSLS(ib,ie) = VarPayWSLS(ib,ie) + ThisPayWSLS*ThisPayWSLS;
        end
        ExPayAtft(ib,ie) = -a^2*b*e.^3*w + a^2*b*e.^2*w + a^2*c*e.^3*w - a^2*c*e.^2*w + a*b*e.^3*w - a*b*e.^2*w - a*c*e.^3*w + a*c*e.^2*w - b*e.^3*w + b*e.^2*w + b*e - b + c*e.^3*w - c*e.^2*w - c*e+c;
        ExPayAtft(ib,ie) = -ExPayAtft(ib,ie)./(2*a^2*e.^2*w^2 - 2*a^2*e.^2*w - 2*a*e.^2*w^2 + 2*a*e.^2*w + 2*e.^2*w^2 - 2*e.^2*w - e*w^2 + e*w - w +1);

    end

end   
 
EPayWSLS = EPayWSLS/niter;
VarPayWSLS = VarPayWSLS/niter - EPayWSLS.*EPayWSLS;
S = sqrt(VarPayWSLS)/sqrt(niter);


subplot(1,3,1)
plot(eVal,ExPayAtft(1,:))
title('b = 2, w = 0.95')
hold on
errorbar(eVal,EPayWSLS(1,:),2*S(1,:))
axis([0 0.5 0 60])
xlabel('error rate (e)')
ylabel('payoff')
legend('V(ATFT|ATFT','V(WSLS|WSLS')
hold off

subplot(1,3,2)
plot(eVal,ExPayAtft(2,:))
title('b = 3, w = 0.95')
hold on
errorbar(eVal,EPayWSLS(2,:),2*S(2,:))
axis([0 0.5 0 60])
xlabel('error rate (e)')
ylabel('payoff')
legend('V(ATFT|ATFT','V(WSLS|WSLS')
hold off

subplot(1,3,3)
plot(eVal,ExPayAtft(3,:))
title('b = 4, w = 0.95')
hold on
errorbar(eVal,EPayWSLS(3,:),2*S(3,:))
axis([0 0.5 0 60])
xlabel('error rate (e)')
ylabel('payoff')
legend('V(ATFT|ATFT','V(WSLS|WSLS')
hold off
