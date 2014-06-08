%sdrSettingsSave
%Whenever new parameters or new value to parameters are needed, run this
%file first.

clc;
clear all;

%Parameters----------------------------------------------------------------
mLength = 10000;         %Message length
srcType = 'random';     %Source type
srcFile = 'none';       %Message source path
modSchm = 'PSK';        %Modulation scheme
M = 2;                  %Number of levels for modulation scheme
energy = 1;             %Energy with which the symbols will be normalized
f = struct(...          %Pulse shaping filter parameters
    'type','Root-Raised-Cosine',... %Shape
    'sps', 10,...                   %Samples per symbol
    'T', 1,...                      %Symbol period
    'nt', 5,...                 %Parameter used for filter length
    'r', 0.5);                      %Roll-off factor
psFilter = pulseShapingFilter(f);   %Pulse shaping filter
oversample = f.sps;        %Oversampling factor
synchAlg = 'Early-Late Gate';       %Symbol synch algorithm
Fc = 433e6;                         %Carrier frequency
Fs = 4*Fc;                          %Sample rate
bpfParams = struct(...              %Demod's band-pass filter parameters
            'rolloff', 0.4,...      %Roll-off factor
            'q', f.sps,...          %Oversample factor
            'order', 64);           %FIR filter order
%bpf = demodBPF(Fc, Fs, bpfParams);  %BPF coefficients
%bpfParams = struct(...              %Demod's band-pass filter parameters
%            'rolloff', 0.4,...      %Roll-off factor
%            'q', f.sps,...          %Oversample factor
%            'order', 64);           %FIR filter order
%bpf = demodBPF(Fc, Fs, bpfParams);  %BPF coefficients
synchWordLength = 255;
codingAlgorithm = 'BCH';
codingParams = struct(...
               'n', 255,...
               'k', 199);

save('sdrSettings.mat')
