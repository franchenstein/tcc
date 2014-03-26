function [ber] = bitErrorRate(originalMsg, recovrdMsg)
%bitErrorRate - Calculates the bit error rate.
%--------------------------------------------------------------------------
%   INPUTS:
%       originalMsg: the original source message that was transmitted;
%       recovrdMsg: the final message that was recovered at the receiver.
%   OUTPUTS:
%       ber: the calculated Bit Error Rate of the system.
%   DESCRIPTION:
%       Calculates the bit error rate between the original and recovered
%       messages in simulation, by comparing both with XOR, summing up all
%       the 1's of the result and dividing by the total length of the
%       message.
%--------------------------------------------------------------------------

if (length(originalMsg) == length(recovrdMsg))
    ber = sum(xor(originalMsg,recovrdMsg))/length(originalMsg);
else
    error('Recovered message does not have same length as original one');
end

end

