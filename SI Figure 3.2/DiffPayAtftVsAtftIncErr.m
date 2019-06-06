
% This function calculates the difference in expected payoff between and ATFT player playing another ATFT player and 
% a  Sneaky player vs an ATFT
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
function [pay] = DiffPayAtftVsAtftIncErr(a,b,w,e,inc)

pay = VAtftVsAtft(a,b,w,e) - VAtftIncErrVsAtft(a,b,w,e,inc);

end