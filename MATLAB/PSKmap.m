function [pskSymbols] = PSKmap(bits, M)
%PSKmap - Maps bits to the complex symbols of an MPSK scheme.
%--------------------------------------------------------------------------
%   INPUTS:
%       bits - the original bitstream that will be modulated;
%       M - M-arity of the scheme being used. Right now, M will only be 
%           equal to 2. log2(M) bits will be mapped to one symbol.
%   OUTPUTS:
%       symbols - Complex symbols from the modulation scheme constellation.
%   DESCRIPTION:
%       This block will map log2(M) bits to one symbol of the MPSK schame.
%--------------------------------------------------------------------------

switch M
    case 2
        pskSymbols = complex(2*bits - 1,0);
    otherwise
        error('Invalid or not implemented value of M for PSK');
end

end