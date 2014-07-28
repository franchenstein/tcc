function [theta] = costasLoop(inSig, Fc, Fs, order, mu)
%costasLoop - estimates carrier phase offset using Costas Loop.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - the received signal which needs carrier phase offset correction;
%       Fc - carrier frequency;
%		Fs - sampling frequency;
%		order - desired order for the filters used in the algorithms;
%		mu - desired stepsize to be used in the algorithms;
%   OUTPUTS:
%      theta - phase offset estimate;
%   DESCRIPTION:
%   	Applies the Costas Loop algorithm in the original signal to estimate the
%		carrier phase offset to be returned.
%--------------------------------------------------------------------------
	t = 0:length(inSig)/10;

	ff = [0 0.01 0.02 1]; fa = [1 1 0 0];
	h = firpm(order, ff, fa);
	
	theta = zeros(1, length(t)); theta(1) = 0;
	zc = zeros(1, order + 1); zs = zeros(1, order + 1);
	updates = zeros(1, order + 1);
	
	for i = 1:length(t) -1
		zc = [zc(2:order + 1), 2*inSig(i)*cos(2*pi*(Fc/Fs)*t(i) + theta(i))];
		zs = [zs(2:order + 1), -2*inSig(i)*sin(2*pi*(Fc/Fs)*t(i) + theta(i))];
		lpf1 = fliplr(h)*zc'; lpf2 = fliplr(h)*zs';
			
		theta(i + 1) = theta(i) + mu*lpf1*lpf2;
	end
	
	disp('Plotting Costas Loop theta estimation progress with each iteration');
	figure();	
    plot(t,theta);
    title('Costas Loop');
    xlabel('Iteration');
    ylabel('Theta estimation');
	
	theta = mean(theta(end - 100 : end));

end
