%This program computes the minimum value of a to invade ALLD given w, e, b
% using fzero and DiffPayAtftDAlld


bfix = 3;                                                                   %baseline values
wfix = .95;
rfix = .1;


rVal = [.05 .1 .15];                                                        %varying parameter values
wVal = [.9 .95 .99];
bVal = [2 3 4];
eVal = 0:0.05:0.5;
maxie = length(eVal);

minAvalr = zeros(3,maxie);                                                  %initialize result vectors
minAvalw = zeros(3,maxie);
minAvalb = zeros(3,maxie);

w = wfix;
b = bfix;
for ir = 1:length(rVal)                                                     %r varies
    r = rVal(ir);
    a0 = 0.5;
    for ie = 1:maxie
        e = eVal(ie);
        fun = @(a) DiffPayAtftVDAlldInvade(a,b,w,e,r);                      % parameterized function
        a0 = fzero(fun,a0);
        if a0 < 0                                                           % make sure root exists
            a0 = 0;
        elseif a0 > 1
            a0 = 1;
        end
        minAvalr(ir,ie) = a0;                                               % root = min value of a
    end
end

r = rfix;
b = bfix;
for iw = 1:length(rVal)                                                     %w varies
    w = wVal(iw);
    a0 = 0.5;
    for ie = 1:maxie
        e = eVal(ie);
        fun = @(a) DiffPayAtftVDAlldInvade(a,b,w,e,r);                     % parameterized function
        a0 = fzero(fun,a0);
        if a0 < 0                                                           %make sure root exists
            a0 = 0;
        elseif a0 > 1
            a0 = 1;
        end
        minAvalw(iw,ie) = a0;                                               %root = min value of a
    end
end

r = rfix;
w = wfix;
for ib = 1:length(rVal)
    b = bVal(ib);
    a0 = 0.5;
    for ie = 1:maxie
        e = eVal(ie);
        fun = @(a) DiffPayAtftVDAlldInvade(a,b,w,e,r);                           % parameterized function
        a0 = fzero(fun,a0);
        if a0 < 0
            a0 = 0;
        elseif a0 > 1
            a0 = 1;
        end
        minAvalb(ib,ie) = a0;
    end
end

subplot(1,2,1)
plot(eVal,minAvalr(1,:),eVal,minAvalr(2,:),eVal,minAvalr(3,:));
titlestr1 = strcat('r varies: b/c = ',num2str(bfix),' w = ',num2str(wfix));
title(titlestr1)
xlabel('error rate (e)');
ylabel({'min arbitration accuracy';' for ATFT to invade DALLD'});
axis([0 0.5 0.5 1])
lstr1r = strcat('r = ',num2str(rVal(1)));
lstr2r = strcat('r = ',num2str(rVal(2)));
lstr3r = strcat('r = ',num2str(rVal(3)));
legend(lstr1r,lstr2r,lstr3r);

% comment out graph you don't want
% subplot(2,1,2)
% plot(eVal,minAvalw(1,:),eVal,minAvalw(2,:),eVal,minAvalw(3,:));
% titlestr2 = strcat('w varies: b/c = ',num2str(bfix),' r = ',num2str(rfix));
% title(titlestr2)
% xlabel('error rate (e)');
% ylabel({'min arbitration accuracy';' for ATFT to invade DALLD'});
% axis([0 0.5 0 1])
% lstr1w = strcat('w = ',num2str(wVal(1)));
% lstr2w = strcat('w = ',num2str(wVal(2)));
% lstr3w = strcat('w = ',num2str(wVal(3)));
% legend(lstr1w,lstr2w,lstr3w);

subplot(1,2,2)
plot(eVal,minAvalb(1,:),eVal,minAvalb(2,:),eVal,minAvalb(3,:));
titlestr2 = strcat('b/c varies: w = ',num2str(wfix),' r = ',num2str(rfix));
title(titlestr2)
xlabel('error rate (e)');
ylabel({'min arbitration accuracy';' for ATFT to invade DALLD'});
axis([0 0.5 0.5 1])
lstr1b = strcat('b/c = ',num2str(bVal(1)));
lstr2b = strcat('b/c = ',num2str(bVal(2)));
lstr3b = strcat('b/c = ',num2str(bVal(3)));
legend(lstr1b,lstr2b,lstr3b);
    
