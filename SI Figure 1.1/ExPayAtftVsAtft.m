
function [V] = ExPayAtftVsAtftP(a,b,w,e)

c = 1;
 
V = -a.^2*b*e^3*w + a.^2*b*e^2*w + a.^2*c*e^3*w - a.^2*c*e^2*w + a*b*e^3*w - a*b*e^2*w - a*c*e^3*w + a*c*e^2*w - b*e^3*w + b*e^2*w + b*e - b + c*e^3*w - c*e^2*w - c*e+c;
V = -V./(2*a.^2*e^2*w^2 - 2*a.^2*e^2*w - 2*a*e^2*w^2 + 2*a*e^2*w + 2*e^2*w^2 - 2*e^2*w - e*w^2 + e*w - w +1);

end

% 