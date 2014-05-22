function [synchdMsg delay] = slidingCorrelator(inSig, mLength)
%slidingCorrelator - Applies the sliding correlator algorithm to recover frame
%synch.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - the symbol synchornized signal that needs to be frame
%                 synchronized.
%       mLength - the length of the original message.
%   OUTPUTS:
%      synchMsg - the frame synchronized message, that will only need to be
%                 demapped and decoded;
%       delay -
%   DESCRIPTION:
%    The sliding correlator algorithm will be applied comparing the symbol
%    synchronized message to the training sequence. From it, the delay will
%    be estimated and then used to correct the message, that will have its
%    header removed.
%--------------------------------------------------------------------------

trainingSequence = load('mSequence.mat');
trainingSequence = trainingSequence.sequence;
trainingSequence = double(trainingSequence > 0);

inSig = ~inSig;	% The bits get inverted somehow -- TODO: research reasons.

corrltdSig = xcorr(trainingSequence, double(inSig));
plot(corrltdSig)
[~, delay] = max(corrltdSig);
delay = length(inSig) - delay(1) + 1;

trainingLength = length(trainingSequence);

synchdMsg = inSig(delay + trainingLength:...
                  (delay + trainingLength+ mLength - 1));
              
delay = delay - 1;

end
