%receiver - simulates the SDR receiver

%Copying the TX parameters, just in case...
%Parameters----------------------------------------------------------------
%See sdrSettingsSave for a complete list of the used parameters.
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
if(msgFlag)
    disp('******Analog demodulation******');
end

if(plotFlag)
    figure();
    agcPlot = struct('x', 4, 'y', 2, 'p', 1);
    clPlot = struct('x', 4, 'y', 2, 'p', 2);
end

[rxSig, theta]= demodulator(corruptSig, Fc, Fs, agcStep, clStep, enableAGC,...
                           enableCL, agcPlot, clPlot, plotFlag, msgFlag);%, bpf);


if(plotFlag)                            
    disp('Plotting demodulated signal.');
    c = f.nt + length(symbols) - 1/f.sps;
    t2 = -f.nt : 1/f.sps : c;
    subplot(4,2,3),plot(rxSig);
    title('Demodulated signal');
    xlabel('Time');
    ylabel('Amplitude');
    axis([0 500 -(max(rxSig) + 1) (max(rxSig) + 1)]);
end

%--------------------------------------------------------------------------
%Matched Filtering
%--------------------------------------------------------------------------
if(msgFlag)
    disp('******Matched Filtering******');
end

if strcmp(matchfilt, 'Matched')
    rxFilter = pulseShapingFilter(rxF);
    rSymbols = matchedFiltering(rxSig, rxFilter);
	t1 = -rxF.nt:1/rxF.sps:rxF.nt;
else
    ff = [0 0.2 0.25 1]; fa = [1 1 0 0]; order = 32;
    rxFilter = firpm(order, ff, fa);
    rSymbols = conv(rxSig, rxFilter);
    t1 = -order/2:order/2;
end

E = mean(rSymbols.^2);

if(plotFlag)
    subplot(4,2,4), plot(t1,rxFilter);
    title('Receive Filter');
    xlabel('Time');
    ylabel('Amplitude');
    disp('Plotting matched-filtered signal (peaks at symbol time).');
    subplot(4,2,5),plot(rSymbols);
    title('Matched-Filtering');
    xlabel('Time');
    ylabel('Amplitude');
    axis([0 500 -(max(rSymbols) + 1) (max(rSymbols) + 1)]);
end

%--------------------------------------------------------------------------
%Symbol Timing Synchronization
%--------------------------------------------------------------------------
if(msgFlag)
    disp('******Symbol Synchronization******');
end

plotparams = struct('x', 4, 'y', 2, 'p', 6);
if(enableEL)
    [synchSymbols, allignOffset] = symbolSynch(rSymbols, rxOversample,...
                                           codeLength + synchWordLength,...
                                           2*f.nt, synchAlg, elStep, plotparams,...
                                           plotFlag);
else
    a = rxF.nt * rxOversample + 1;
    b = a + (codeLength + synchWordLength - 1)*rxOversample;
    synchSymbols = rSymbols(a: rxOversample : b);
    allignOffset = 0;
end

if(plotFlag)
    disp('Plotting sampled signal');
    subplot(4,2,7), plot(rSymbols);
    hold on;
    t3 = 1 + f.sps^2 : f.sps : f.sps*length(synchSymbols) + f.sps^2;
    subplot(4,2,7), stem(t3, synchSymbols, 'r');
    title('Matched-Filtered signal and the samples taken');
    xlabel('Time');
    ylabel('Amplitude');
    axis([0 500 -(max(synchSymbols) + 1) (max(synchSymbols) + 1)]);
    hold off;
end

%--------------------------------------------------------------------------
%Frame Synchronization
%--------------------------------------------------------------------------
if(msgFlag)
    disp('******Frame Synchronization******');
end

if (enableCorr)
    plotparams.p = 8;
    [symbols, delay] = slidingCorrelator(synchSymbols, codeLength, plotparams,...
                                         plotFlag);
else
    delay = 0;
    trainingSequence = load('mSequence.mat');
    trainingSequence = trainingSequence.sequence;
    trainingLength = length(trainingSequence);
    symbols = synchSymbols(trainingLength : trainingLength + codeLength - 1);
end

if(plotFlag)
    disp('Plotting received constellation');
    scatterplot(symbols);
end

%--------------------------------------------------------------------------
%Demapping
%--------------------------------------------------------------------------
if(msgFlag)
    disp('******Modulation Scheme Demapping******');
end

bits = demapper(symbols, rxModSchm, rxM);

%--------------------------------------------------------------------------
%Decoder
%--------------------------------------------------------------------------
if(msgFlag)
    disp('******Channel Decoding******');
end

if (enableCoding)
    rxBits = decoder(bits, rxCodingAlgorithm, rxCodingParams, mLength);
else
    rxBits = bits;
end

%--------------------------------------------------------------------------
%Sink
%--------------------------------------------------------------------------
if(msgFlag)
    disp('******Message Recovery******');
end

sink_msg = sink(rxBits, srcType, sinkFile);
