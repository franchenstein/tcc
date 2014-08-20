function [demodulatedSig, theta] = demodulator(rxSig, Fc, Fs, agcStep, clStep,...
                                               agcEnable, clEnable,...
                                               agcPlot, clPlot)%, bpf)
%demodulator - Demodulates the received signal with the appropriate
%corrections.
%--------------------------------------------------------------------------
%   INPUTS:
%       rxSig - the received signal;
%       Fc - the carrier frequency; 
%       Fs - the sample rate;
%       bpf - the band-pass filter coefficients;
%       agcStep - Automatic Gain Control's algorithm step size;
%       clStep - Costas Loop's step size;
%       agcEnable - determines whether or not to use the AGC;
%       clEnable - determine whether or not to use Costas Loop;
%       agcPlot - plot parameters to be used by the agc's subplot;
%       clPlot - plot parameters to be used by the Costas Loop's subplot.
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
disp('******Automatic Gain Control******');
if (agcEnable)
    [sig gain] = agc(rxSig, agcStep, agcPlot);
    agcSig = gain*rxSig;
else
    demodulatedSig = demodulatedSig;
end

%--------------------------------------------------------------------------
%Carrier Phase Offset Estimation
%--------------------------------------------------------------------------
disp('******Estimating Phase Offset******');
    j = sqrt(-1);
if(clEnable)
    theta = carrierPhaseCorrection(agcSig, Fc, Fs, 100, clStep,...
                                   'Costas Loop', 0, 0, clPlot);
    phaseCorrection = exp(-j*theta);
else
    theta = 0;
    phaseCorrection = 1;
end;

%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
t = 0:(length(rxSig) - 1);
carrier = real(exp(j*2*pi*(Fc/Fs)*t)*phaseCorrection);
demodulatedSig = carrier.*rxSig;

end
