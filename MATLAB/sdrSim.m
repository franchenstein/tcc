%simulation - connects the TX, channel model and the RX

clear
clc

%Simulation parameters-----------------------------------------------------
timingOffset = 6.24;      %timing offset in % in the channel
nGain = 0;            %Noise gain
%--------------------------------------------------------------------------

%Transmitter---------------------------------------------------------------
sdrTX;

%Channel-------------------------------------------------------------------
rxSig = channelModel(txSig, f.sps, timingOffset, nGain);

%Receiver------------------------------------------------------------------
sdrRX;

%Results-------------------------------------------------------------------

e = 100*bitErrorRate(msg, rxBits);

fprintf('BER: %2.2f%%. \n', e);
fprintf('Allignment offset: %d.\n', allignOffset);
fprintf('Delay: %d.\n', delay);
