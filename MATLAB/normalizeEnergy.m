function [normalizedSymbols] = normalizeEnergy(symbols, symbolEnergy)
%normalizedSymbols - Normalizes symbol energy for the sequence.
%--------------------------------------------------------------------------
%   INPUTS:
%       symbols - the message in complex symbol format;
%       symbolEnergy - the desired energy for the symbols;
%   OUTPUTS:
%       normalizedSymbols - symbols with normalized energy
%   DESCRIPTION:
%       This block takes the message after it was mapped to the modulation
%       scheme's constellation and normalizes their energy.
%--------------------------------------------------------------------------

t1 = sum(abs(symbols).^2)/length(symbols);
t2 = sqrt(t1*symbolEnergy);
normalizedSymbols = t2*symbols;

end