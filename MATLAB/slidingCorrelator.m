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

corrltdSig = xcorr(trainingSequence, inSig);
[~, posMax] = max(abs(corrltdSig));
signMax = sign(corrltdSig(posMax(1)));
delay = length(inSig) - posMax(1) + 1;

trainingLength = length(trainingSequence);
synchdMsg = signMax*inSig(delay + trainingLength :...
                         (delay + trainingLength + mLength - 1));
              
delay = delay - 1;

end
