function [bpFilter] = demodBPF(Fc, Fs, bpfParams)
%demodBPF - creates the demod's band pass filter
%--------------------------------------------------------------------------
%   INPUTS:
%       Fc - the carrier frequency; 
%       Fs - the sample rate;
%       bpfParams - the band pass filter parameters (rolloff factor, 
%                    the oversample and the order).
%   OUTPUTS:
%      bbFilter - the bandpass filter itself.
%   DESCRIPTION:
%    Creates a FIR band-pass filter with the desired parameters to recover
%    only the desired band from the received signal.
%--------------------------------------------------------------------------

R = Fs/bpfParams.q;
bw = (1 + bpfParams.rolloff)*R;
wi = 2*(Fc - bw)/Fs;
ws = 2*(Fc + bw)/Fs;
bpFilter = fir1(bpfParams.order, [wi ws]);

end