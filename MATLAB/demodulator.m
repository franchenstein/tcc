function [demodulatedSig] = demodulator(rxSig, Fc, Fs, bpf)
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
filtrdSig = conv(rxSig, bpf);

%AGC:
%TODO: agc

%Carrier-Phase Recovery:
%TODO: costas loop
theta = 0;

%Demodulation:
j = sqrt(-1);
t = 0:(length(rxSig) - 1);
carrier = exp(-j*2*pi*(Fc/Fs)*t + theta);
demodulatedSig = hilbert(rxSig).*carrier;

end