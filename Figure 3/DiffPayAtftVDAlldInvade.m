
%EpayalldvSAtft - This function calculates the expected payoff for focall DALLD player vs an ATFT 
%player interacting in a PD with an observer/arbitrator.
%
%Input values are as follows:
%   b = benefit of cooperation
%   c = cost of cooperation = 1
%   w = probability of continuation
%   a = probability that the arbitrator is correct
%   e = probability of a C->D implementation error
%
function [pay] = DiffPayAtftVDAlldInvade(a,b,w,e,r)

c = 1;

ExPayAtftVsDAlld = -(1-e)*c*(1-a*w+(1-a)*w)./(1-a*w-w^2*(1-a));

ExPayAtftVsAtft = -a.^2*b*e^3*w + a.^2*b*e^2*w + a.^2*c*e^3*w - a.^2*c*e^2*w + a*b*e^3*w - a*b*e^2*w - a*c*e^3*w + a*c*e^2*w - b*e^3*w + b*e^2*w + b*e - b + c*e^3*w - c*e^2*w - c*e+c;
ExPayAtftVsAtft = -ExPayAtftVsAtft./(2*a.^2*e^2*w^2 - 2*a.^2*e^2*w - 2*a*e^2*w^2 + 2*a*e^2*w + 2*e^2*w^2 - 2*e^2*w - e*w^2 + e*w - w +1);

pay = r*ExPayAtftVsAtft + (1-r)*ExPayAtftVsDAlld;

end