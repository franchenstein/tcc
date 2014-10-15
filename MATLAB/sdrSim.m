%simulation - connects the TX, channel model and the RX

clear
clc
warning('off', 'all')

%Loads TX and RX parameters:
load('sdrSettings.mat');

%--------------------------------------------------------------------------

disp('******Starting Simulation******');
plotFlag = 1;
msgFlag = 1;

%Transmitter---------------------------------------------------------------
sdrTX;

%Channel-------------------------------------------------------------------
corruptSig = channelModel(txSig, energy, oversample, timingOffset, nGain,...
                          fp, fg, theta, msgFlag);

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
axis([0 25 -(max(real(corruptSig)) + 1) (max(real(corruptSig)) + 1)])
subplot(2,1,2), plot(t2, imag(corruptSig)); %t2 defined in sdrTX
title('Quadrature Channel-corrupted signal');
xlabel('Time');
ylabel('Amplitude');
axis([0 25 -(max(imag(corruptSig)) + 1) (max(imag(corruptSig)) + 1)])
                     

%Receiver------------------------------------------------------------------
sdrRX;

%Results-------------------------------------------------------------------

e = 100*bitErrorRate(msg, rxBits);

Eb_Noise = E; %Check the sdrRX
 
%Run the receiver again without noise, so the expected BER can be estimated:
plotFlag = 0;
msgFlag = 0;
corruptSig = channelModel(txSig, energy, oversample, timingOffset, 0,...
                          fp, fg, theta, msgFlag);
sdrRX;
Eb = E;
No = abs(2*(Eb_Noise - Eb));

ee = 100*berEstimate(Eb, No, modSchm, M); 

disp('******End Results******');
fprintf('BER: %2.2f%%. \n', e);
fprintf('Expected BER: %2.2f%%. \n', ee);
fprintf('Allignment offset: %d.\n', allignOffset);
fprintf('Frame offset: %d.\n', delay);
fprintf('Phase offset: %2.2f.\n', theta);

warning('on', 'all')
