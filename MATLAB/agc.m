function [outSig, gain] = agc(inSig, agcStep)
%agc - Corrects fading profile using automatic gain control.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - received signal, suffering from a fading profile.
%   OUTPUS:
%       outSig - signal multiplied by the corrected gain.
%   DESCRIPTION:
%       This block will correct a fading profile using an adaptive
%       technique to find a gain that will keep the average signal power as
%       close to the desired power as possible. This gain will multiply the
%       received signal in order to correct it.
%--------------------------------------------------------------------------

lr = length(inSig);
ds = mean(abs(inSig).^2);    %Desired average power
g = zeros(1, lr); g(1) = 1; %Gain initialization
mu = agcStep;    %Stepsize
nr = zeros(1, lr);

for i = 1:lr - 1
    nr(i) = g(i)*inSig(i);
    g(i+1) = g(i) - mu*(nr(i)^2 - ds);
end

outSig = nr;
gain = g;

disp('Plotting AGC evolution per iteration.');
figure();
i = 1:lr;
plot(i, g);
title('AGC');
xlabel('Iteration');
ylabel('Gain');

end
