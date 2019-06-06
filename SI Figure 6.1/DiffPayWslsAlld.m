%DiffPayWslsAlld - This function calculates the expected payoff for an ALLD  
%player interacting in a PD with a WSLS player. Uses EpayALLDVsWSLS(b,t,e)
%and EpayWSLSVsWSLS(b,t,e)
%
%Input values are as follows:
%   b = benefit of cooperation
%   t = number of interactions
%   a = probability that the arbitrator is correct
%   e = probability of a C->D implementation error
%
%
%
function [D] = DiffPayWslsAlld(b,w,e)

niter = 10000;
EPayWSLS = 0;
EPayAlld = 0;

for i = 1:niter
   t = geornd(1-w) + 1;                                                     %Draw geometrically distributed random length of interaction t
   ThisPayWSLS = EpayWSLSVsWSLS(b,t,e);                                     %Get payoff for WSLS vs WSLS
   EPayWSLS = EPayWSLS + ThisPayWSLS;                                       %sum payoff

   ThisPayAlld = EpayALLDVsWSLS(b,t,e);                                     %Do the same for Alld vs WSLS
   EPayAlld = EPayAlld + ThisPayAlld;
   
end

D =  EPayWSLS/niter - EPayAlld/niter;                                       %Compute difference in average payoffs




    
