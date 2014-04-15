%noiseTest - tests the system for various noise levels.

clear
clc

noises = 0:0.001:1;
timingOffset = 0;
ber = zeros(1, length(noises));

%Transmitter---------------------------------------------------------------
sdrTX;

for h = 1:length(noises)
%Channel-------------------------------------------------------------------
    rxSig = channelModel(txSig, oversample, timingOffset, noises(h));

%Receiver------------------------------------------------------------------
    sdrRX;
    
    ber(h) = bitErrorRate(msg, rxBits);
    
end

semilogy(fliplr(noises),ber)