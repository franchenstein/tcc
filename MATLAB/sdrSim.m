%simulation - connects the TX, channel model and the RX

clear
clc
warning('off', 'all')

%Loads TX and RX parameters:
load('sdrSettings.mat');

%--------------------------------------------------------------------------

disp('******Starting Simulation******');

%Transmitter---------------------------------------------------------------
sdrTX;

%Channel-------------------------------------------------------------------
corruptSig = channelModel(txSig, energy, oversample, timingOffset, nGain,...
                          fp, fg, theta);

figure();
disp('Plotting channel-corrupted analog signal.');
if length(corruptSig) < length(t2)
	pad = zeros(1, length(length(t2) - length(corruptSig)));
	corruptSig = [corruptSig pad];
end
subplot(2,1,1), plot(t2, real(corruptSig)); %t2 defined in sdrTX
title('In-Phase Channel-corrupted signal');
xlabel('Time');
ylabel('Amplitude');
subplot(2,1,2), plot(t2, imag(corruptSig)); %t2 defined in sdrTX
title('Quadrature Channel-corrupted signal');
xlabel('Time');
ylabel('Amplitude');
                     

%Receiver------------------------------------------------------------------
sdrRX;

%Results-------------------------------------------------------------------

e = 100*bitErrorRate(msg, rxBits);

disp('******End Results******');
fprintf('BER: %2.2f%%. \n', e);
fprintf('Allignment offset: %d.\n', allignOffset);
fprintf('Frame offset: %d.\n', delay);
fprintf('Phase offset: %d.\n', theta);

warning('on', 'all')
