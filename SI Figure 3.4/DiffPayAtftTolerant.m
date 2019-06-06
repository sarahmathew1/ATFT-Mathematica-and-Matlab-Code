
%DiffPayAtftTolerant - This function calculates the difference in expected payoff for ATFT player vs an ATFT 
%player less the payoff of a Tolerant player interacting with an ATFT player.
%
%Input values are as follows:
%   b = benefit of cooperation
%   c = cost of cooperation = 1
%   w = probability of continuation
%   a = probability that the arbitrator is correct
%   e = probability of a C->D implementation error
%
%
%
function [pay] = DiffPayAtftTolerant(a,b,w,e)

c = 1;

ExPayTolerantVsAtft = ((1-e)*(b-c)+w*b*e*(1-e)*(1-2*a))/((1-w)*(1+e*w*(1-a)));

ExPayAtftVsAtft = -a.^2*b*e^3*w + a.^2*b*e^2*w + a.^2*c*e^3*w - a.^2*c*e^2*w + a*b*e^3*w - a*b*e^2*w - a*c*e^3*w + a*c*e^2*w - b*e^3*w + b*e^2*w + b*e - b + c*e^3*w - c*e^2*w - c*e+c;
ExPayAtftVsAtft = -ExPayAtftVsAtft./(2*a.^2*e^2*w^2 - 2*a.^2*e^2*w - 2*a*e^2*w^2 + 2*a*e^2*w + 2*e^2*w^2 - 2*e^2*w - e*w^2 + e*w - w +1);

pay = ExPayAtftVsAtft - ExPayTolerantVsAtft;

end