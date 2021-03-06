function [samples allignOffset] = ELGate(inSig, oFactor, del, mLength, nt,...
                                         elStep, plotparams, plotFlag)
%ELGate - Implements the Early-Late Gate algorithm for symbol
%synchronization.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - matched filtered signal, with its peaks at the optimum
%               moments for sampling;
%       downFactor - samples per symbol; 
%       del - the step between the samples to the left and to the right;
%       mLength - the original message length;
%       nt - half the size of the pulse.
%       elStep - the step size of the algorithm;
%       plotparams - the subplot position parameters;
%       plotFlag - whether the plots should or shouldn't be displayed.
%   OUTPUTS:
%      synchdSig - the resampled signal, now correctly synchronized;
%       allignOffset - the allignment offset measured by the algorithm.
%   DESCRIPTION:
%    Using the Early-Late Gate algorithm, the signal will have its symbols
%    synchronized.
%--------------------------------------------------------------------------

tnow = nt*oFactor+1;
tau = 0; xs = zeros(1,mLength); i = 0;
mu = elStep;
tau_plot = [];

while tnow < length(inSig) - nt*oFactor
    i = i + 1;
    xs(i) = inSig(ceil(tnow+tau*oFactor));
    x_deltap = inSig(ceil(tnow+tau*oFactor)+del);
    x_deltan = inSig(ceil(tnow+tau*oFactor)-del);
    dx = x_deltap - x_deltan;
    tau = tau + mu*dx*xs(i);
    tnow = tnow + oFactor;
    tau_plot = [tau_plot tau];    
end

allignOffset = round(tau*oFactor);
%a and b are used to discard the tails inserted by the pulse shaping
a = nt*oFactor + 1 + allignOffset;
b = a + (mLength - 1)*oFactor;
samples = downsample(inSig(a:b), oFactor);
                         
if(plotFlag)                  
    disp('Plotting sample timing estimation.');
    subplot(plotparams.x,plotparams.y,plotparams.p), plot(10*tau_plot);
    title('Sample timing estimation per iteration (Early-Late Gate)');
    xlabel('Iteration');
    ylabel('Tau');
    axis([0 length(tau_plot) -6 6]);
end

end
