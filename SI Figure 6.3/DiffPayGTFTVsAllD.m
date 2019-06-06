%This program computes expected fitness of GTFT in a 
%in a population in which GTFT is common and calculated the difference in
%fitness with ATFT in a population in which ATFT is common
%common.

function [pay] = DiffPayGTFTVsAllD(g,b,w,e)


niter = 10000;
EPayGTFT = 0;
EPayAlld = 0;

for i = 1:niter
    
   t = geornd(1-w) + 1;                                                     %each iteration draw t from geometric distiribution

   EPayGTFT = EPayGTFT + EpayGTFTVsGTFT(b,t,g,e);                           %EpayGTFTVsGTFT compute sitness of GTFT in one iteration

   EPayAlld = EPayAlld + EpayALLDVsGTFT(b,t,g,e);                           %EpayAllDVsGTFT compute sitness of AllD in one iteration

end
  
pay = (EPayGTFT-EPayAlld)/niter;                                            %return difference in average fitness


    
