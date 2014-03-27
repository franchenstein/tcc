function [outSig] = matchedFiltering(inSig, psFilter)
%matchedFiltering - Eliminates white noise and recovers signal with a
%matched filter.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - input complex symbol that needs to be filtered;
%       psFilter - the pulse shaping filter to be matched;                       
%   OUTPUTS:
%      outSig - the matched filtered signal, that needs to be synchronized.
%   DESCRIPTION:
%    Based on psFilter, a matched filter is generated and then used to
%    filter inSig,  returning a signal with its maxes at the points where
%    it should be sampled. This function is performed by the next block in
%    the receiver.
%--------------------------------------------------------------------------

mFilter = fliplr(psFilter);
outSig = conv(mFilter, inSig);

end