function [rxSig] = channelModel(txSig, sps, timingOffset, nGain)
%channelModel - simulates the channel with all its imparities.
%--------------------------------------------------------------------------
%   INPUTS:
%       txSig - The transmitted modulated signal;
%       sps - samples per symbol used in the communication;
%       timingOffset - the timing offset as % of symbol period;
%       nGain - the AWG noise gain/amplitude.
%   OUTPUTS:
%       rxSig - the signal received by the RX, after it's corrupted by the
%               channel.
%   DESCRIPTION:
%       This block will take the transmitted signal and corrupt it in
%       various ways that could happen in a wireless channel: additive
%       gaussian white noise, carrier phase offset, fading, multipath
%       effects, delays and timing errors.
%--------------------------------------------------------------------------

corruptSig = txSig;

%Additive White Gaussian Noise
corruptSig = corruptSig + nGain*randn(size(corruptSig));

%Adding timing offset/delay
timingOffset = floor(0.01*timingOffset*sps);
corruptSig = corruptSig(1+timingOffset:end);

rxSig = corruptSig;

end