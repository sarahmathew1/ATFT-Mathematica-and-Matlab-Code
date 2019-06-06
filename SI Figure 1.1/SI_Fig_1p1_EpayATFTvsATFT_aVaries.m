%This program computes the expected payoff of ATFT playing ATFT as a function a a the arbibration accuracy
%
%   b = benefit of cooperation
%   t = number of interactions
%   a = prob accurate arbitration
%   e = probability of a C->D implementation error
%
        
wfix= 0.95;
bfix = 3;
efix = .1;


wVal = [.9 .95 .99];
bVal = [2 3 4];
eVal = [0.01,0.1,.25];

a = 0:0.05:0.5;
maxie = length(aVal);

VvalW = zeros(3,maxie);
VvalB = zeros(3,maxie);
VvalE = zeros(3,maxie);

b = bfix;
e = efix;
for ib = 1:length(wVal)                                                     %iterate over w   
    w = wVal(ib);
    for ia = 1:maxie                                                        %iterate over e
        VvalW(ib,ia) = ExPayAtftVsAtft(a(ia),b,w,e);                               % min a value = root of DiffPay
    end
end
    
w = wfix;
e = efix;
for ib = 1:length(wVal)                                                     %iterate over w   
    b = bVal(ib);
    a0 = 0.5;
    for ia = 1:maxie                                                        %iterate over e
        VvalB(ib,ia) = ExPayAtftVsAtft(a(ia),b,w,e);                               % min a value = root of DiffPay
    end
end


w = wfix;
b = bfix;
for ib = 1:length(wVal)                                                     %iterate over w   
    e = eVal(ib);
    a0 = 0.5;
    for ia = 1:maxie                                                        %iterate over e
        VvalE(ib,ia) = ExPayAtftVsAtft(a(ia),b,w,e);                               % min a value = root of DiffPay
    end
end


subplot(1,3,1)
plot(aVal,VvalB(1,:),aVal,VvalB(2,:),aVal,VvalB(3,:));
title('w = 0.95, inc = 0.1')
ylabel('V(ATFT|ATFT)');
xlabel({'arbitration accuracy (a)'});
% axis([0 .5 0 1])
lstr1 = strcat('b = ',num2str(bVal(1)));
lstr2 = strcat('b = ',num2str(bVal(2)));
lstr3 = strcat('b = ',num2str(bVal(3)));
legend(lstr1,lstr2,lstr3);

subplot(1,3,2)
plot(aVal,VvalW(1,:),aVal,VvalW(2,:),aVal,VvalW(3,:));
title('b = 3, e = 0.1')
ylabel('V(ATFT|ATFT)');
xlabel({'arbitration accuracy (a)'});
% axis([0 .5 0 1])
lstr1 = strcat('w = ',num2str(wVal(1)));
lstr2 = strcat('w = ',num2str(wVal(2)));
lstr3 = strcat('w = ',num2str(wVal(3)));
legend(lstr1,lstr2,lstr3);

subplot(1,3,3)
plot(aVal,VvalE(1,:),aVal,VvalE(2,:),aVal,VvalE(3,:));
title('b = 3, w = 0.95')
ylabel('V(ATFT|ATFT)');
xlabel({'arbitration accuracy (a)'});
% axis([0 .5 0 1])
lstr1 = strcat('e = ',num2str(eVal(1)));
lstr2 = strcat('e = ',num2str(eVal(2)));
lstr3 = strcat('e = ',num2str(eVal(3)));
legend(lstr1,lstr2,lstr3);



    
