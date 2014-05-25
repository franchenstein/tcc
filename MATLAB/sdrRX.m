%receiver - simulates the SDR receiver

%Copying the TX parameters, just in case...
%Parameters----------------------------------------------------------------
%See sdrSettingsSave for a complete list of the used parameters.
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
[rxSig, theta]= demodulator(corruptSig, Fc, Fs);%, bpf);

%--------------------------------------------------------------------------
%Matched Filtering
%--------------------------------------------------------------------------
rSymbols = matchedFiltering(rxSig, psFilter);

%--------------------------------------------------------------------------
%Symbol Timing Synchronization
%--------------------------------------------------------------------------
[synchSymbols, allignOffset] = symbolSynch(rSymbols, oversample,...
                                           mLength + synchWordLength,...
                                           2*f.nt, synchAlg);

%--------------------------------------------------------------------------
%Frame Synchronization
%--------------------------------------------------------------------------
[rxBits, delay] = slidingCorrelator(synchSymbols, mLength);

%--------------------------------------------------------------------------
%Demapping
%--------------------------------------------------------------------------
rxBits = demapper(rxBits, modSchm, M);
