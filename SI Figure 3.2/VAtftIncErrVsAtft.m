function[Vef] = VAtftIncErrVsAtft(a,b,w,ep,inc)
% calculates the fitness of an Vatft player whose probability of error is
% e + inc.  These are intentional "errors". He is
%playing a Vatft player who does not make additional errors

ef = ep  +  inc;
c = 1;

Vef = b - c + c*ef - b*ep + b*ef*w - 2*a*b*ef*w - c*ep*w + 2*a*c*ep*w - 2*b*ef*ep*w + 3*a*b*ef*ep*w - a.^2*b*ef*ep*w + 2*c*ef*ep*w - 3*a*c*ef*ep*w + a.^2*c*ef*ep*w - c*ef^2*ep*w;
Vef = Vef + a*c*ef^2*ep*w - a.^2*c*ef^2*ep*w + b*ef*ep^2*w - a*b*ef*ep^2*w + a.^2*b*ef*ep^2*w - b*ef^2*ep*w^2 + 3*a*b*ef^2*ep*w^2 - 3*a.^2*b*ef^2*ep*w^2 + 2*a.^3*b*ef^2*ep*w^2;
Vef = Vef + c*ef*ep^2*w^2 - 3*a*c*ef*ep^2*w^2 + 3*a.^2*c*ef*ep^2*w^2 - 2*a.^3*c*ef*ep^2*w^2 + b*ef^2*ep^2*w^2 - 3*a*b*ef^2*ep^2*w^2 + 3*a.^2*b*ef^2*ep^2*w^2;
Vef = Vef - 2*a.^3*b*ef^2*ep^2*w^2 - c*ef^2*ep^2*w^2 + 3*a*c*ef^2*ep^2*w^2 - 3*a.^2*c*ef^2*ep^2*w^2 + 2*a.^3*c*ef^2*ep^2*w^2;
D = 1 + ef*w - a*ef*w + ep*w - a*ep*w - 2*ef*ep*w + 2*a*ef*ep*w - 2*a.^2*ef*ep*w + ef*ep*w^2 - 2*a*ef*ep*w^2 - ef^2*ep*w^2 + 3*a*ef^2*ep*w^2 - 3*a.^2*ef^2*ep*w^2;
D = D + 2*a.^3*ef^2*ep*w^2 - ef*ep^2*w^2 + 3*a*ef*ep^2*w^2 - 3*a.^2*ef*ep^2*w^2 + 2*a.^3*ef*ep^2*w^2;

Vef=  - Vef./((-1 + w)*D);

end

