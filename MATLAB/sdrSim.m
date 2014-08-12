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
if length(t2) > length(corruptSig)
    pad = zeros(1,length(t2) - length(corruptSig));
    corruptSig = [corruptSig pad];
end
disp('Plotting channel-corrupted analog signal.');
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
Eb = 2;
No = nGain^2;
ee = 100*qfunc(sqrt(2*Eb/No));

disp('******End Results******');
fprintf('BER: %2.2f%%. \n', e);
fprintf('Expected BER: %2.2f%%. \n', ee);
fprintf('Allignment offset: %d.\n', allignOffset);
fprintf('Frame offset: %d.\n', delay);
fprintf('Phase offset: %2.2f.\n', theta);

warning('on', 'all')
