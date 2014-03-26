function [bits] = demapper(symbols, scheme, M)
%demapper - Demaps complex symbols to the bits of the selected mod scheme.
%--------------------------------------------------------------------------
%   INPUTS:
%       symbols - the received complex symbols that will be translated;
%       scheme - the modulation scheme to be used. Right now, only BPSK is
%                implemented;
%       M - M-arity of the scheme being used. Right now, M will only be 
%           equal to 2. log2(M) bits will be mapped to one symbol;
%   OUTPUTS:
%       bits - Translated bits from the scheme's constellation.
%   DESCRIPTION:
%       This block will map one PSK symbol to log2(M) bits of the selected
%       modulation scheme.
%--------------------------------------------------------------------------

switch(scheme)
    case 'PSK'
        bits = PSKdemap(symbols,M);
    otherwise
        error('Invalid or not-implemented modulation scheme');
end

end

