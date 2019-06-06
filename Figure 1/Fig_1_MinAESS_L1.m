%This program computes the minimum value of a given w, e, b to resist
%invasion by L1 using fzero and DiffPayL1

wFix = .95;                                                                 %Baseline values
bFix = 3;

eVal = 0.001:0.001:0.5;                                                     %varying parameter values, min e = 0.001 to avoid 0/0 at e=0
wVal = [.9 .95 .99];                                                        
bVal = [2 3 4];
maxie = length(eVal);

minAvalW = zeros(3,maxie);                                                  %initialize result vectors
minAvalB = zeros(3,maxie);

for iw = 1:length(wVal)                                                     % w varies
    w = wVal(iw);
    b = bFix;
    a0 = 0.5;
    for ie = 1:maxie
        e = eVal(ie);
        fun = @(a)DiffPayAtftL1(a,b,w,e);                                % difference in fitness Atft and Allc
        a0 = fzero(fun,a0);
        minAvalW(iw,ie) = a0;                                               %min a value = root
    end
    z = minAvalW(iw,:);
end

for ib = 1:length(bVal)                                                     %bvaries
    w = wFix;
    b = bVal(ib);
    a0 = 0.5;
    for ie = 1:maxie
        e = eVal(ie);
        fun = @(a)DiffPayAtftL1(a,b,w,e);                                % difference in fitness
        a0 = fzero(fun,a0);
        minAvalB(ib,ie) = a0;
    end
end
    
subplot(1,2,1)
plot(eVal,minAvalW(1,:),eVal,minAvalW(2,:),eVal,minAvalW(3,:));
title(' b = 3');
xlabel('error rate (e)');
ylabel('arbitration accuracy (a)');
axis([0 0.5, 0 1])
lstr1 = strcat('w = ',num2str(wVal(1)));
lstr2 = strcat('w = ',num2str(wVal(2)));
lstr3 = strcat('w = ',num2str(wVal(3)));
legend(lstr1,lstr2,lstr3);

subplot(1,2,2)
plot(eVal,minAvalB(1,:),eVal,minAvalB(2,:),eVal,minAvalB(3,:));
title('w = 0.95');
xlabel('error rate (e)');
ylabel('arbitration accuracy (a)');
axis([0 0.5, 0 1])
lstr1 = strcat('b = ',num2str(bVal(1)));
lstr2 = strcat('b = ',num2str(bVal(2)));
lstr3 = strcat('b = ',num2str(bVal(3)));
legend(lstr1,lstr2,lstr3);
    
