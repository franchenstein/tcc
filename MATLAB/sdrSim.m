%simulation - connects the TX, channel model and the RX

clear
clc
warning('off', 'all')

%Loads TX and RX parameters:
sdrSettingsPrompt;

%--------------------------------------------------------------------------

disp('******Starting Simulation******');

%Transmitter---------------------------------------------------------------
sdrTX;

%Channel-------------------------------------------------------------------
corruptSig = channelModel(txSig, energy, oversample, timingOffset, nGain,...
                          fp, fg, theta);

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
