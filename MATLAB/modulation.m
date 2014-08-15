function [txSig] = modulation(pulses, Fc, Fs, gain)
%modulation - simulates the modulation of the pulses into an analog
%carrier.
%--------------------------------------------------------------------------
%   INPUTS:
%       pulses - the message after pulse shaping;
%       Fc - the carrier frequency;
%       Fs - the sampling frequency;
%       gain - defines the amplitude of the transmitted signal.
%   OUTPUTS:
%      txSig - the modulated signal that will be transmitted.
%   DESCRIPTION:
%    After the message was processed through the receiver into pulses, it
%    will be modulated into a complex exponential with frequency Fc. This
%    will result in a signal with an In-Phase and a Quadrature component
%    that will be transmitted over the air. This block only simulates this
%    process, once this needs to be done by analog circuitry.
%    NOTE: For the purpose of adding carrier phase offset in the channel,
%    the Hilbert transform is not taken at this point, where it should be.
%    instead, the channel adds the carrier phase offset and then takes the
%    Fourier transform.
%--------------------------------------------------------------------------

j = sqrt(-1);
t = 0:(length(pulses) - 1);
carrier = exp(j*2*pi*(Fc/Fs).*t);
txSig = gain*pulses.*carrier;

end
