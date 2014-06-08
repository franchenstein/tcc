function [demodulatedSig, theta] = demodulator(rxSig, Fc, Fs)%, bpf)
%demodulator - Demodulates the received signal with the appropriate
%corrections.
%--------------------------------------------------------------------------
%   INPUTS:
%       rxSig - the received signal;
%       Fc - the carrier frequency; 
%       Fs - the sample rate;
%       bpf - the band-pass filter coefficients;
%   OUTPUTS:
%      demodulatedSig - the signal after demodulation, containing the
%                       pulses that should be matched filtered.
%   DESCRIPTION:
%    The signal is multiplied again by a sinusoid in the carrier frequency
%    so the pulses can be recovered. This block will also use a band-pass
%    filter to recover just the desired band and will apply the AGC and
%    Costas-Loop to correct carrier phase offset and fading.
%--------------------------------------------------------------------------

%Band pass filtering:
%filtrdSig = conv(rxSig, bpf);

%--------------------------------------------------------------------------
%Automatic Gain Control
%--------------------------------------------------------------------------
agcSig = agc(rxSig);

%--------------------------------------------------------------------------
%Carrier Phase Offset Estimation
%--------------------------------------------------------------------------
theta = carrierPhaseCorrection(agcSig, Fc, Fs, 100, 0.08, 'Costas Loop', 0, 0);
j = sqrt(-1);
phaseCorrection = exp(-j*theta);

%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
t = 0:(length(rxSig) - 1);
carrier = real(exp(j*2*pi*(Fc/Fs)*t)*phaseCorrection);
demodulatedSig = carrier.*agcSig;

end
