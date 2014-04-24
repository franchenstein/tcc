function [psFilter] = pulseShapingFilter(filterParams)
%pulseShapingFilter - generates the pulse shaping filter, which will also
%be used for matched filtering.
%--------------------------------------------------------------------------
%   INPUTS:
%       filterParams - a struct containing the parameters to build the
%                      filter, which are:
%
%                       type - the type of the filter, that can be
%                       Rectangular, Root Raised-Cosine or Gaussian;
%                       sps - Samples/symbol;
%                       T - sample period;
%                       r - rolloff factor (for rcos);
%                       length - filter length (for rcos);
%                       bt - 3-dB bandwith-symbol time product (for gauss).
%                       
%   OUTPUTS:
%      psFilter - The filter which has to be convolved with the transmitted
%      data.
%   DESCRIPTION:
%    Based on the filterParams, a pulse-shaping filter is created and its
%    coefficients are returned.
%--------------------------------------------------------------------------

switch filterParams.type
    case 'Rectangular'
        psFilter = ones(1,filterParams.sps);
        return
    case 'Root-Raised-Cosine'
        psFilter = rcosfir(filterParams.r, filterParams.nt,...
                           filterParams.sps, filterParams.T, 'sqrt');
    case 'Gaussian'
        psFilter = gaussfir(filterParams.bt, filterParams.T,...
                               filterParams.sps);
    otherwise
        error('Invalid or not-implemented pulse shape.');                               
end

end
