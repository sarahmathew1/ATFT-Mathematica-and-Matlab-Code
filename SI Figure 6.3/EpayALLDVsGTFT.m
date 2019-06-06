%EpayALLDVsWSLS - This function calculates the expected payoff for an ALLD  
%player interacting in a PD with a GTFT player.
%
%Input values are as follows:
%   b = benefit of cooperation
%   t = number of interactions
%   a = probability that the arbitrator is correct
%   err_cd = probability of a C->D implementation error
%
function [pay] = EpayALLDVsGTFT(b,t,g,e)

    behav = true(2,1);                                                                      %initialize behavior
    pay = 0;                                                                                %focal payoff
    FocIntent = false;                                                                      % Alld intends to defect
    PartIntent = true;                                                                      % ATFT intends coop
    
    for it = 1:t                                                                            %loop for t
       
        PartBehave = PartIntent && (rand > e);                                              %cooperate if intend to and no error
        FocBehave = FocIntent && (rand > e);
        
        pay = pay + b*PartBehave - FocBehave;                                               %payoff to focal
        
        PartIntent = FocBehave || (rand < g);
        
        
    end 
end