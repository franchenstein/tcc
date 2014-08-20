%transmitter - this script simulates all the steps of the SDR transmitter.

%Parameters----------------------------------------------------------------
%See sdrSettingsSave for a complete list of the used parameters.
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%Message Generation
%--------------------------------------------------------------------------
disp('******Generating message bitstream******');
[msg, mLength] = source(srcType, mLength, srcFile); %Message bits are generated

msg_mean = mean(msg);
msg_var = var(msg);
fprintf('Mean value of the message bits: %2.2f \n', msg_mean);
fprintf('Variation of the message bits: %2.2f \n', msg_var);

%--------------------------------------------------------------------------
%Encoder
%--------------------------------------------------------------------------
disp('******Channel coding the message******');
if (enableCoding)
    [code, codeLength] = coder(double(msg), codingAlgorithm, codingParams);
else
    code = msg;
    codeLength = length(code);
end

%--------------------------------------------------------------------------
%Frame Generation
%--------------------------------------------------------------------------
disp('******Inserting preamble******');
[frame, synchWordLength] = framer(code); %Includes training sequence as header

%--------------------------------------------------------------------------
%Bit-to-Symbol Mapping
%--------------------------------------------------------------------------
disp('******Modulation scheme mapping******');
symbols = mapper(frame, modSchm, M, energy); %Maps bits to the symbols of
                                             %corresponding mod scheme.
disp('Plotting message constellation (scatter plot).');
scatterplot(symbols);
disp('Plotting transmitted message.');
figure();
subplot(4,2,1), stem(real(symbols));
axis([0 100 -2 2]);
xlabel('Sample');
ylabel('Symbol');
title('In-phase TX symbols (100 first)');
subplot(4,2,2), stem(imag(symbols));
axis([0 100 -2 2]);
axis([0 100 -2 2]);
xlabel('Sample');
ylabel('Symbol');
title('Quadrature TX symbols (100 first)');
                                             
%--------------------------------------------------------------------------
%Pulse Shaping
%--------------------------------------------------------------------------
disp('******Applying pulse shaping filter******');
psFilter = pulseShapingFilter(f);
pulses = pulseShaping(symbols, oversample, psFilter, f);

disp('Plotting pulse shape');
t1 = -f.nt:1/f.sps:f.nt;
subplot(4,2,3), plot(t1, psFilter);
title('Pulse-Shape');
xlabel('Time');
ylabel('Amplitude');

disp('Plotting pulse shaped signal.');
c = f.nt + length(symbols) - 1/f.sps;
t2 = -f.nt : 1/f.sps : c;;
subplot(4,2,5), plot(t2,real(pulses));
title('In-Phase Pulse-Shaped Signal');
xlabel('Time');
ylabel('Amplitude');
axis([0 50 -(max(real(pulses)) + 1) (max(real(pulses)) + 1)]);
subplot(4,2,6), plot(t2,imag(pulses));
title('Quadrature Pulse-Shaped Signal');
xlabel('Time');
ylabel('Amplitude');
axis([0 50 -(max(imag(pulses)) + 1) (max(imag(pulses)) + 1)]);

%--------------------------------------------------------------------------
%Modulation
%--------------------------------------------------------------------------
disp('******Analog modulation******');
txSig = modulation(pulses, Fc, Fs, 1);
disp('Plotting transmitted analog signal.');
subplot(4,2,7), plot(t2,real(txSig));
title('In-Phase TX Signal');
xlabel('Time');
ylabel('Amplitude');
axis([0 25 -(max(real(txSig)) + 1) (max(real(txSig)) + 1)]);
subplot(4,2,8), plot(t2,imag(txSig));
title('Quadrature TX Signal');
xlabel('Time');
ylabel('Amplitude');
axis([0 25 -(max(imag(txSig)) + 1) (max(imag(txSig)) + 1)]);

