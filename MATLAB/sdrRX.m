%receiver - simulates the SDR receiver

%Copying the TX parameters, just in case...
%Parameters----------------------------------------------------------------
%See sdrSettingsSave for a complete list of the used parameters.
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
disp('******Analog demodulation******');
[rxSig, theta]= demodulator(corruptSig, Fc, Fs, agcStep, clStep, enableAGC,...
                            enableCL);%, bpf);
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
rxFilter = pulseShapingFilter(rxF);
rSymbols = matchedFiltering(rxSig, rxFilter);
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
if(enableEL)
    [synchSymbols, allignOffset] = symbolSynch(rSymbols, rxOversample,...
                                           codeLength + synchWordLength,...
                                           2*f.nt, synchAlg, elStep);
else
    a = rxF.nt * rxOversample + 1;
    b = a + (codeLength + synchWordLength - 1)*rxOversample;
    synchSymbols = rSymbols(a: rxOversample : b);
    allignOffset = 0;
end

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
if (enableCorr)
    [symbols, delay] = slidingCorrelator(synchSymbols, codeLength);
else
    delay = 0;
    symbols = synchSymbols(trainingLength : trainingLength + codeLength - 1);
end

disp('Plotting received constellation');
scatterplot(symbols);

%--------------------------------------------------------------------------
%Demapping
%--------------------------------------------------------------------------
disp('******Modulation Scheme Demapping******');
bits = demapper(symbols, rxModSchm, rxM);

%--------------------------------------------------------------------------
%Decoder
%--------------------------------------------------------------------------
disp('******Channel Decoding******');
if (enableCoding)
    rxBits = decoder(bits, rxCodingAlgorithm, rxCodingParams, rxMLength);
else
    rxBits = bits;
end

%--------------------------------------------------------------------------
%Sink
%--------------------------------------------------------------------------
disp('******Message Recovery******');
sink_msg = sink(rxBits, srcType, sinkFile);
