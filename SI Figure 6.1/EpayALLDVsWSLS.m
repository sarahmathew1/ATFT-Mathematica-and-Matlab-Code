%EpayALLDVsWSLS - This function calculates the expected payoff for an ALLD  
%player interacting in a PD with a WSLS player.
%
%Input values are as follows:
%   b = benefit of cooperation
%   t = number of interactions
%   a = probability that the arbitrator is correct
%   e = probability of a C->D perception error
%
%
%
function [pay] = EpayALLDVsWSLS(b,t,e)

    behav = true(2,1);                                                      %initialize behavior
    pay = 0;                                                                %focal payoff
    FocIntent = false;
    PartIntent = true;
    
    for it = 1:t                                                            %loop for t

       
        PartBehave = PartIntent && (rand > e);                              %cooperate if intend to and no error                              
        FocBehave = FocIntent && (rand > e);
        
        pay = pay + b*PartBehave - FocBehave;                               %payoff to focal
        
        PartIntent = ~xor(FocBehave,PartBehave);                            %Intend to coop if CC or DD
        
        
    end 
end