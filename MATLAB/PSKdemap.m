function [pskBits] = PSKdemap(symbols, M)
%PSKdemap - Maps the complex symbols to the bits of an MPSK scheme.
%--------------------------------------------------------------------------
%   INPUTS:
%       symbols - the received complex symbols that will be translated;
%       M - M-arity of the scheme being used. Right now, M will only be 
%           equal to 2. log2(M) bits will be mapped to one symbol.
%   OUTPUTS:
%      bits - The translated bit stream according to the PSK constellation.
%   DESCRIPTION:
%    This block will map one PSK symbol to log2(M) bits of the MPSK scheme.
%--------------------------------------------------------------------------

switch M
    case 2
        pskBits = sign(symbols) > 0;
    otherwise
        error('Invalid or not implemented value of M for PSK');
end

end