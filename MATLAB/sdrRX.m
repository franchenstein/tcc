%receiver - simulates the SDR receiver

%Copying the TX parameters, just in case...
%Parameters----------------------------------------------------------------
mLength = 1000;         %Message length
srcType = 'random';     %Source type
srcFile = 'none';       %Message source path
modSchm = 'PSK';        %Modulation scheme
M = 2;                  %Number of levels for modulation scheme
energy = 1;             %Energy with which the symbols will be normalized
f = struct(...          %Pulse shaping filter parameters
    'type','Root-Raised-Cosine',... %Shape
    'sps', 16,...                   %Samples per symbol
    'T', 1,...                      %Symbol period
    'length', 25,...                %Parameter used for filter length
    'r', 0.5);                      %Roll-off factor
psFilter = pulseShapingFilter(f);   %Pulse shaping filter
oversample = 16;        %Oversampling factor
synchAlg = 'Early-Late Gate';       %Symbol synch algorithm
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%Matched Filtering
%--------------------------------------------------------------------------
rSymbols = matchedFiltering(pulses, psFilter);

%--------------------------------------------------------------------------
%Symbol Timing Synchronization
%--------------------------------------------------------------------------
[synchSymbols, allignOffset] = symbolSynch(rSymbols, oversample, synchAlg);

%--------------------------------------------------------------------------
%Demapping
%--------------------------------------------------------------------------
synchBits = demapper(synchSymbols, modSchm, M);

%--------------------------------------------------------------------------
%Frame Synchronization
%--------------------------------------------------------------------------
[rxBits, delay] = slidingCorrelator(synchBits, mLength);
