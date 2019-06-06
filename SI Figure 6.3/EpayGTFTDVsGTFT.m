%EpayAtft - This function calculates the expected payoff of a focal GTFT player
%who has a higher forgiveness probability when paired with a standard GTFT 
%players interacting in a PD 
%
%Input values are as follows:
%   b = benefit of cooperation
%   t = number of interactions
%   g1 = prob defecting after a defection of focal
%   g2 = prob defecting after a defection of partner
%   err_cd = probability of a C->D implementation error
%
%And the output is
%   pay = (2,1) vector of expected payoffs
%
%
function [pay] = EpayGTFTDVsGTFT(b,t,g1,g2,e)

    behav = true(2,1);                                                                      %initialize behavior
    pay = 0;                                                                                %focal payoff
    FocIntent = true;
    PartIntent = true;
    
    for it = 1:t                                                                            %loop for t

       
        PartBehave = PartIntent && (rand > e);
        FocBehave = FocIntent && (rand > e);
        
        pay = pay + b*PartBehave - FocBehave;                                               %payoff to focal
        
        FocIntent = PartBehave || rand < g1;
        PartIntent = FocBehave || rand < g2;
        
        
    end 
end