function [ber] = berEstimate(Eb, No, ModSchm, M)
%berEstimate - estimates the BER from the error probability formula.
%--------------------------------------------------------------------------
%   INPUTS:
%       Eb - bit energy;
%       No - noise energy;
%       ModSchm - modulation scheme used in the communication;
%       M - the M-arity of the modulation scheme.
%   OUTPUTS:
%      ber - The estimated BER from the formula.
%   DESCRIPTION:
%    Uses the bit error probability to estimate the BER that the communication
%    system should suffer.
%--------------------------------------------------------------------------

switch(ModSchm)
    case 'PSK'
        switch(M)
            case 2
                ber = qfunc(sqrt(2*Eb/No));
            otherwise
                error('BER estimation only implemented for BPSK');
        end
    otherwise
        error('BER estimation only implemented for PSK');
end      
