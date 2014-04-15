%receiver - simulates the SDR receiver

%Copying the TX parameters, just in case...
%Parameters----------------------------------------------------------------
mLength = 10;         %Message length
srcType = 'random';     %Source type
srcFile = 'none';       %Message source path
modSchm = 'PSK';        %Modulation scheme
M = 2;                  %Number of levels for modulation scheme
energy = 1;             %Energy with which the symbols will be normalized
f = struct(...          %Pulse shaping filter parameters
    'type','Root-Raised-Cosine',... %Shape
    'sps', 15,...                   %Samples per symbol
    'T', 1,...                      %Symbol period
    'length', 8,...                 %Parameter used for filter length
    'r', 0.5);                      %Roll-off factor
psFilter = pulseShapingFilter(f);   %Pulse shaping filter
oversample = 20;        %Oversampling factor
synchAlg = 'Early-Late Gate';       %Symbol synch algorithm
Fc = 433e6;                         %Carrier frequency
Fs = 4*Fc;                          %Sample rate
bpfParams = struct(...              %Demod's band-pass filter parameters
            'rolloff', 0.4,...      %Roll-off factor
            'q', f.sps,...          %Oversample factor
            'order', 64);           %FIR filter order
bpf = demodBPF(Fc, Fs, bpfParams);  %BPF coefficients
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
rxSig = demodulator(rxSig, Fc, Fs, bpf);

%--------------------------------------------------------------------------
%Matched Filtering
%--------------------------------------------------------------------------
rSymbols = matchedFiltering(rxSig, psFilter);

%--------------------------------------------------------------------------
%Symbol Timing Synchronization
%--------------------------------------------------------------------------
[synchSymbols, allignOffset] = symbolSynch(rSymbols, oversample,...
                                           f.sps, synchAlg);

%--------------------------------------------------------------------------
%Demapping
%--------------------------------------------------------------------------
synchBits = demapper(synchSymbols, modSchm, M);

%--------------------------------------------------------------------------
%Frame Synchronization
%--------------------------------------------------------------------------
[rxBits, delay] = slidingCorrelator(synchBits, mLength);
