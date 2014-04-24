%simulation - connects the TX, channel model and the RX

clear
clc

%Loads TX and RX parameters:
sdrSettingsSave;

%Simulation parameters-----------------------------------------------------
timingOffset = 20;      %timing offset in % in the channel
nGain = 0;            %Noise gain
%--------------------------------------------------------------------------

%Transmitter---------------------------------------------------------------
sdrTX;

%Channel-------------------------------------------------------------------
corruptSig = channelModel(txSig, oversample, timingOffset, nGain);

%Receiver------------------------------------------------------------------
sdrRX;

%Results-------------------------------------------------------------------

e = 100*bitErrorRate(msg, rxBits);

fprintf('BER: %2.2f%%. \n', e);
fprintf('Allignment offset: %d.\n', allignOffset);
%fprintf('Delay: %d.\n', delay);
