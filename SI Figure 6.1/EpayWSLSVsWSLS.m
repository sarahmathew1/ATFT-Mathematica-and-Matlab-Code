%EpayAtft - This function calculates the expected payoff for two WSLs 
%players interacting in a PD 
%
%Input values are as follows:
%   b = benefit of cooperation
%   t = number of interactions
%   g = prob defecting after a defection
%   e = probability of a C->D implementation error
%
%
%
function [pay] = EpayWSLSVsWSLS(b,t,e)

    pay = 0;                                                                %focal payoff
    FocIntent = true;                                                       %initially both intend to cooperate
    PartIntent = true;
    
    for it = 1:t                                                            %loop for t
        
        PartBehave = PartIntent && (rand > e);                              %cooperate if intend to and no error
        FocBehave = FocIntent && (rand > e);
        
        pay = pay + b*PartBehave - FocBehave;                               %payoff to focal
        
        FocIntent = ~xor(FocBehave,PartBehave);                             %Intend to coop if CC or DD
        PartIntent = ~xor(FocBehave,PartBehave);
        
        
    end 
end