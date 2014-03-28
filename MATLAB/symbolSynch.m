function [synchdSig allignOffset] = symbolSynch(inSig, downFactor, algorithm)
%symbolSynch - Applies the chosen algorithm to the matched filtered signal
%to recover symbol synchronism.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - matched filtered signal, with its peaks at the optimum
%               moments for sampling;
%       downFactor - the downsampling factor;
%       algorithm - the synchronization algorithm to be used. Right now, 
%                   only the Early-Late Gate algorithm is implemented.                      
%   OUTPUTS:
%      synchdSig - the resampled signal, now correctly synchronized;
%       allignOffset - the allignment offset measured by the algorithm.
%   DESCRIPTION:
%    The chosen synchronization algorithm will be computed to figure out
%    the delay and the correct time to sample the signal. The signal will
%    be synchronized and downsampled.
%--------------------------------------------------------------------------

switch algorithm
    case 'Early-Late Gate'
        [alligndSig allignOffset] = ELGate(inSig, downFactor, 25);
    otherwise
        error('Invalid or not implemented symbol synchronization algorithm.');
end

synchdSig = downsample(alligndSig, downFactor);

end