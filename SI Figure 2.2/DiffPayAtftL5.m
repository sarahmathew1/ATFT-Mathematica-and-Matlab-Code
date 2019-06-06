
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
function [pay] = DiffPayAtftL5(a,b,w,e)

c = 1;


V = -a.^2*b*e^3*w + a.^2*b*e^2*w + a.^2*c*e^3*w - a.^2*c*e^2*w + a*b*e^3*w - a*b*e^2*w - a*c*e^3*w + a*c*e^2*w - b*e^3*w + b*e^2*w + b*e - b + c*e^3*w - c*e^2*w - c*e+c;
V = -V./(2*a.^2*e^2*w^2 - 2*a.^2*e^2*w - 2*a*e^2*w^2 + 2*a*e^2*w + 2*e^2*w^2 - 2*e^2*w - e*w^2 + e*w - w +1);

Vf = ExPayAtftVsAtftFocalBad(a,b,w,e);
Vp = ExPayAtftVsAtftPartnerBad(a,b,w,e);

Vc = (1-e)*(b-c+w*V)+e*(b+w*(a.*Vf+(1-a).*Vp)); 
V5 = (1-e)*(b-c+w*(a.*Vf+(1-a).*Vp))+e*(b+w*(a.^2.*Vf+2*a.*(1-a).*V+(1-a).^2.*Vp));

pay = Vc - V5;

end