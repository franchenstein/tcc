function [demodulatedSig, theta] = demodulator(rxSig, Fc, Fs, agcStep, clStep,...
                                               agcEnable, clEnable,...
                                               agcPlot, clPlot, plotFlag,...
                                               msgFlag)%, bpf)
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
%       clPlot - plot parameters to be used by the Costas Loop's subplot;
%       plotFlag - whether the plots should or shouldn't be displayed.
%   OUTPUTS:
%      demodulatedSig - the signal after demodulation, containing the
%                       pulses that should be matched filtered.
%   DESCRIPTION:
%    The signal is multiplied again by a sinusoid in the carrier frequency
%    so the pulses can be recovered. This block will also use a band-pass
%    filter to recover just the desired band and will apply the AGC and
%    Costas-Loop to correct carrier phase offset and fading.
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%Automatic Gain Control
%--------------------------------------------------------------------------
if(msgFlag)
    disp('******Automatic Gain Control******');
end

if (agcEnable)
    [agcSig gain] = agc(rxSig, agcStep, agcPlot, plotFlag);
else
    agcSig = rxSig;
end

%--------------------------------------------------------------------------
%Carrier Phase Offset Estimation
%--------------------------------------------------------------------------
if(msgFlag)
    disp('******Estimating Phase Offset******');
end

    j = sqrt(-1);
if(clEnable)
    theta = carrierPhaseCorrection(agcSig, Fc, Fs, 100, clStep,...
                                   'Costas Loop', 0, 0, clPlot, plotFlag);
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
demodulatedSig = carrier.*agcSig;

%ff = [0 0.1 0.15 1]; fa = [1 1 0 0]; order = 32;
%demodFilter = firpm(order, ff, fa);
%dSig = conv(demodulatedSig, demodFilter);
%g = max(demodulatedSig)/max(dSig);
%demodulatedSig = g*dSig((order/2):(end-(order/2)));

end
