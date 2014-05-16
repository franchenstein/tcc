%receiver - simulates the SDR receiver

%Copying the TX parameters, just in case...
%Parameters----------------------------------------------------------------
%See sdrSettingsSave for a complete list of the used parameters.
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
rxSig = demodulator(corruptSig, Fc, Fs, bpf);

%--------------------------------------------------------------------------
%Automatic Gain Control
%--------------------------------------------------------------------------
agcSig = agc(rxSig);

%--------------------------------------------------------------------------
%Matched Filtering
%--------------------------------------------------------------------------
rSymbols = matchedFiltering(agcSig, psFilter);

%--------------------------------------------------------------------------
%Symbol Timing Synchronization
%--------------------------------------------------------------------------
[synchSymbols, allignOffset] = symbolSynch(rSymbols, oversample,...
                                           mLength + synchWordLength,...
                                           2*f.nt, synchAlg);

%--------------------------------------------------------------------------
%Demapping
%--------------------------------------------------------------------------
synchBits = demapper(synchSymbols, modSchm, M);

%--------------------------------------------------------------------------
%Frame Synchronization
%--------------------------------------------------------------------------
[rxBits, delay] = slidingCorrelator(synchBits, mLength);
