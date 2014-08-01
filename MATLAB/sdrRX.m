%receiver - simulates the SDR receiver

%Copying the TX parameters, just in case...
%Parameters----------------------------------------------------------------
%See sdrSettingsSave for a complete list of the used parameters.
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
disp('******Analog demodulation******');
[rxSig, theta]= demodulator(corruptSig, Fc, Fs);%, bpf);
disp('Plotting demodulated signal.');
figure();
c = f.nt + length(symbols) - 1/f.sps;
t2 = -f.nt : 1/f.sps : c;
plot(t2, rxSig);
title('Demodulated signal');
xlabel('Time');
ylabel('Amplitude');

%--------------------------------------------------------------------------
%Matched Filtering
%--------------------------------------------------------------------------
disp('******Matched Filtering******');
rSymbols = matchedFiltering(rxSig, psFilter);
disp('Plotting matched-filtered signal (peaks at symbol time).');
figure();
plot(rSymbols);
title('Matched-Filtering');
xlabel('Time');
ylabel('Amplitude');

%--------------------------------------------------------------------------
%Symbol Timing Synchronization
%--------------------------------------------------------------------------
disp('******Symbol Synchronization******');
[synchSymbols, allignOffset] = symbolSynch(rSymbols, oversample,...
                                           codeLength + synchWordLength,...
                                           2*f.nt, synchAlg);

disp('Plotting sampled signal');
figure();
plot(rSymbols);
hold on;
t3 = 1 + f.sps^2 : f.sps : f.sps*length(synchSymbols) + f.sps^2;
stem(t3, synchSymbols, 'r');
title('Matched-Filtered signal and the samples taken');
xlabel('Time');
ylabel('Amplitude');
hold off;

%--------------------------------------------------------------------------
%Frame Synchronization
%--------------------------------------------------------------------------
disp('******Frame Synchronization******');
[symbols, delay] = slidingCorrelator(synchSymbols, codeLength);

disp('Plotting received constellation');
scatterplot(symbols);

%--------------------------------------------------------------------------
%Demapping
%--------------------------------------------------------------------------
disp('******Modulation Scheme Demapping******');
bits = demapper(symbols, modSchm, M);

%--------------------------------------------------------------------------
%Decoder
%--------------------------------------------------------------------------
disp('******Channel Decoding******');
rxBits = decoder(bits, codingAlgorithm, codingParams, mLength);

%--------------------------------------------------------------------------
%Sink
%--------------------------------------------------------------------------
disp('******Message Recovery******');
sink_msg = sink(rxBits, srcType);
