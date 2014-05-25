%simulation - connects the TX, channel model and the RX

clear
clc

%Loads TX and RX parameters:
sdrSettingsSave;

%Simulation parameters-----------------------------------------------------
timingOffset = 20;      %timing offset in % in the channel
nGain = 0;            %Noise gain
fp = 0.1;                 %Fading profile frequency
fg = 0.7;                 %Fading profile gain (in %)
theta = -0.8;           %Carrier phase offset
%--------------------------------------------------------------------------

%Transmitter---------------------------------------------------------------
sdrTX;

%Channel-------------------------------------------------------------------
corruptSig = channelModel(txSig, energy, oversample, timingOffset, nGain,...
                          fp, fg, theta);

%Receiver------------------------------------------------------------------
sdrRX;

%Results-------------------------------------------------------------------

e = 100*bitErrorRate(msg, rxBits);

fprintf('BER: %2.2f%%. \n', e);
fprintf('Allignment offset: %d.\n', allignOffset);
fprintf('Frame offset: %d.\n', delay);
fprintf('Phase offset: %d.\n', theta);
