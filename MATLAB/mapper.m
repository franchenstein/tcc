function [symbols] = mapper(bits, scheme, M, symbolEnergy)
%mapper - Maps bits to the complex symbols of the selected mod scheme.
%--------------------------------------------------------------------------
%   INPUTS:
%       bits - the original bitstream that will be modulated;
%       scheme - the modulation scheme to be used. Right now, only BPSK is
%                implemented;
%       M - M-arity of the scheme being used. Right now, M will only be 
%           equal to 2. log2(M) bits will be mapped to one symbol;
%       symbolEnergy - the desired energy per symbol.
%   OUTPUTS:
%       symbols - Complex symbols from the modulation scheme constellation.
%   DESCRIPTION:
%       This block will map log2(M) bits to one symbol of the selected
%       modulation scheme.
%--------------------------------------------------------------------------

switch(scheme)
    case 'PSK'
        symbols = PSKmap(bits,M);
    otherwise
        error('Invalid or not-implemented modulation scheme');
end

symbols = normalizeEnergy(symbols, symbolEnergy);

end

