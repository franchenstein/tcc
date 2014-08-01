function [rxSig] = channelModel(txSig, normEnergy, oversample,...
                                timingOffset, nGain, fp, fg, theta)
%channelModel - simulates the channel with all its imparities.
%--------------------------------------------------------------------------
%   INPUTS:
%       txSig - The transmitted modulated signal;
%       normEnergy - The normalized energy of the signal;
%       oversample - samples per symbol used in the communication;
%       timingOffset - the timing offset as % of symbol period;
%       nGain - the AWG noise gain/amplitude;
%       fp - The fading profile frequency;
%       fg - The fading profile gain (in %);
%       theta - carrier phase offset in radians.
%   OUTPUTS:
%       rxSig - the signal received by the RX, after it's corrupted by the
%               channel.
%   DESCRIPTION:
%       This block will take the transmitted signal and corrupt it in
%       various ways that could happen in a wireless channel: additive
%       gaussian white noise, carrier phase offset, fading, multipath
%       effects, delays and timing errors.
%--------------------------------------------------------------------------
disp('******Message Passing Through Channel******');
corruptSig = txSig;
n = length(corruptSig);

%Carrier phase offset:
phaseOffset = exp(j*theta);
corruptSig = real(corruptSig.*phaseOffset);

%Fading profile
fp = (fg*normEnergy)+abs(sin(2*pi*fp*(1:n)/n));
corruptSig = fp.*corruptSig;


%Additive White Gaussian Noise
corruptSig = corruptSig + nGain*randn(size(corruptSig));

%Adding timing offset/delay
timingOffset = floor(0.01*timingOffset*oversample);
corruptSig = corruptSig(1+timingOffset:end);

rxSig = corruptSig;
end
