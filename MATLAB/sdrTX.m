%transmitter - this script simulates all the steps of the SDR transmitter.

%Parameters----------------------------------------------------------------
%See sdrSettingsSave for a complete list of the used parameters.
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%Message Generation
%--------------------------------------------------------------------------
[msg, mLength] = source(srcType, mLength, srcFile); %Message bits are generated

%--------------------------------------------------------------------------
%Encoder
%--------------------------------------------------------------------------
[code, codeLength] = coder(double(msg), codingAlgorithm, codingParams);

%--------------------------------------------------------------------------
%Frame Generation
%--------------------------------------------------------------------------
[frame, synchWordLength] = framer(code); %Includes training sequence as header

%--------------------------------------------------------------------------
%Bit-to-Symbol Mapping
%--------------------------------------------------------------------------
symbols = mapper(frame, modSchm, M, energy); %Maps bits to the symbols of
                                             %corresponding mod scheme.
                                             
%--------------------------------------------------------------------------
%Pulse Shaping
%--------------------------------------------------------------------------
%Shapes the symbols to the selected pulse shape:
pulses = pulseShaping(symbols, oversample, psFilter, f);

%--------------------------------------------------------------------------
%Modulation
%--------------------------------------------------------------------------
txSig = modulation(pulses, Fc, Fs, 1);
