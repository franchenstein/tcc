function [pulseShapedSignal] = pulseShaping(symbols, upFactor, psFilter,...
                                            params)
%pulseShaping - Shapes the symbols into the the desired pulse shape.
%--------------------------------------------------------------------------
%   INPUTS:
%       symbols - the received complex symbols that will be shaped;
%       upFactor - the upsampling factor that will be usedl
%       psFilter - the coefficients of a Root-Raised-Cosine or Gaussian
%               pulse shaping filter defined in pulseShapingFilter.m. 
%       params - filter parameters used to determine if the shape is
%               rectangular.
%                       
%   OUTPUTS:
%      pulseShapedSignal - The symbols after being filtered by pulse-shape
%                           filter.
%   DESCRIPTION:
%    The generated complex symbols are upconverted and then filter by the
%    pulse shaping filter of choice.
%--------------------------------------------------------------------------

if (params.type == 'Rectangular')
    pulseShapedSignal = rectpulse(symbols. params.sps);
    return
else
    sig1 = upsample(symbols, upFactor);
    pulseShapedSignal = conv(psFilter, sig1);
end

end