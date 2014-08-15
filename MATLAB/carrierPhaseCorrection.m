function [theta] = carrierPhaseCorrection(inSig, Fc, Fs, order, mu, method,...
										  synchWordLength, oversample, plotparams)
%carrierPhaseCorrection - applies the desired algorithm to recover phase offset.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - the received signal which needs carrier phase offset correction;
%       Fc - carrier frequency;
%		Fs - sampling frequency;
%		order - desired order for the filters used in the algorithms;
%		mu - desired mu to be used in the algorithms;
%		method - which algorithm will be used to recover phase offset;
%		synchWordLength - the length of the training sequence word;
%		oversample - the oversample factor;
%       plotparams - the algorithm's subplot parameters.
%   OUTPUTS:
%      theta - phase offset estimate;
%   DESCRIPTION:
%    There is a great chance to have a phase offset in the received signal. This
%	 block will estimate such offset using the user chosen algorithm.
%--------------------------------------------------------------------------

switch(method)
	case 'Costas Loop'
		theta = costasLoop(inSig, Fc, Fs, order, mu, plotparams);
	otherwise
		error('Carrier phase offset correction not implemented or incorrect.');
end

end
		
