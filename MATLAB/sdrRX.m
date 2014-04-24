%receiver - simulates the SDR receiver

%Copying the TX parameters, just in case...
%Parameters----------------------------------------------------------------
%See sdrSettingsSave for a complete list of the used parameters.
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
rxSig = corruptSig;%demodulator(corruptSig, Fc, Fs, bpf);

%--------------------------------------------------------------------------
%Matched Filtering
%--------------------------------------------------------------------------
rSymbols = matchedFiltering(rxSig, psFilter);

%--------------------------------------------------------------------------
%Symbol Timing Synchronization
%--------------------------------------------------------------------------
[synchSymbols, allignOffset] = symbolSynch(rSymbols, oversample,...
                                           mLength, 2*f.nt, synchAlg);

%--------------------------------------------------------------------------
%Demapping
%--------------------------------------------------------------------------
rxBits = demapper(synchSymbols, modSchm, M);

%--------------------------------------------------------------------------
%Frame Synchronization
%--------------------------------------------------------------------------
%[rxBits, delay] = slidingCorrelator(synchBits, mLength);
