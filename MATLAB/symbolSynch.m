function [synchdSig allignOffset] = symbolSynch(inSig, sps, mLength, nt,...
                                                algorithm, step, plotparams)
%symbolSynch - Applies the chosen algorithm to the matched filtered signal
%to recover symbol synchronism.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - matched filtered signal, with its peaks at the optimum
%               moments for sampling;
%       downFactor - the downsampling factor;
%       sps - Samples per symbol;
%       algorithm - the synchronization algorithm to be used. Right now, 
%                   only the Early-Late Gate algorithm is implemented.
%		step - step size to be used by the algorithm;
%		plotparams - the parameters for the algorithm's subplots.
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
        [synchdSig allignOffset] = ELGate(inSig, sps, 1, mLength, nt, step,...
										  plotparams);
    otherwise
        error('Invalid or not implemented symbol synchronization algorithm.');
end

end
