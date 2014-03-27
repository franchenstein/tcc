function [alligndSig allignOffset] = ELGate(inSig, downFactor, del)
%ELGate - Implements the Early-Late Gate algorithm for symbol
%synchronization.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - matched filtered signal, with its peaks at the optimum
%               moments for sampling;
%       downFactor - the downsampling factor; 
%       del - the stepsize of the function.
%   OUTPUTS:
%      synchdSig - the resampled signal, now correctly synchronized;
%       allignOffset - the allignment offset measured by the algorithm.
%   DESCRIPTION:
%    Using the Early-Late Gate algorithm, the signal will have its symbols
%    synchronized.
%--------------------------------------------------------------------------

N = [1:downFactor];
tau = [];

for i = N
    y = downsample(inSig(i:end),downFactor);
    y_p = conj([y(del+1:end) zeros(1,del)]);
    y_n = [zeros(1,del) y(1:end-del)];
    est = sum(abs(y.*(y_p - y_n)));
    tau = [tau est];
end

allignOffset = find(tau == max(tau));
alligndSig = inSig(allignOffset:end);

end