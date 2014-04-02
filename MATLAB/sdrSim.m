%simulation - connects the TX, channel model and the RX

%Transmitter---------------------------------------------------------------
sdrTX;

%Channel-------------------------------------------------------------------
%TODO: Channel model

%Receiver------------------------------------------------------------------
sdrRX;

%Results-------------------------------------------------------------------

e = 100*bitErrorRate(msg, rxBits);

fprintf('BER: %2.2f%%. \n', e);
fprintf('Allignment offset: %d.\n', allignOffset);
fprintf('Delay: %d.\n', delay);
