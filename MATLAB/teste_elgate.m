%teste - early late gate
close all
clear all

mLength = 10000;          %Comprimento da mensagem
oFactor = 10;           %Oversampling
fLength = 11;           %Largura do pulso
nt = (fLength - 1)/2;   %Fator N_T do pulso
to = 0;                 %Offset de símbolo em porcentagem do tempo de símbolo

%Gera a mensagem, símbolos, pulso e sinal no tempo:
bits = (randn(1, mLength) > 0.5);   %Mensagem de bits aleatórios
dados = 2*bits - 1;                 %Mapeamento para símbolos BPSK
pulso = rcosfir(0.25, nt, oFactor, 1);  %Gera o pulso cosseno levantado
t = -nt:1/oFactor:nt;               %Vetor de tempo para duração do pulso
dados_up = upsample(dados,oFactor); %Usa o oversampling pra dar upsample no símbolos
sinal = conv(dados_up, pulso);      %Convolui o pulso com os símbolos upsampleados
c = nt + mLength - 1/oFactor;       %Limite superior do vetor de tempo do sinal
t2 = -nt:1/oFactor:c;               %Vetor de tempo do sinal

%Plot do sinal no tempo:
%figure()
%plot(t2, sinal)
%hold on

%Amostragem ideal, com conhecimento a priori do tempo de amostragem:
a = nt*oFactor + 1;             %Posição da primeira amostra
b = a + (mLength - 1)*oFactor;  %Posição da última amostra
amostrasIdeais = sinal(a:oFactor:b); %Reamostra o sinal, fazendo downsample

t3 = 0:mLength - 1;            %Vetor tempo para o sinal reamostrado
%stem(t3,amostrasIdeais, 'r')   %Plota as amostras por cima do sinal
%hold off

e1 = sum(xor(bits,(sign(amostrasIdeais)> 0)))/mLength; %Calcula BER do sinal recebido

%%-------------------------------------------------------------------------


%Teste do EL Gate:
e3 = zeros(1,length(to));
%offset = e3;

%for i = 1:length(to)
timingOffset = floor(0.01*to*oFactor); %Transforma o offset de porcentagem em número de amostras
corruptSig = sinal(1+timingOffset:end); %Insere erro de símbolo no sinal

[amostras2, offset] = ELGate(corruptSig, oFactor, 1, mLength, nt);

r2 = amostras2 > 0;
e3 = sum(xor(bits,r2))/mLength
%end
% 
% figure()
% plot(to, e3*100)
% xlabel('Offset de símbolo (em porcentagem do período de símbolo)')
% ylabel('BER (em %)')
% 
% figure()
% plot(to, round(abs(oFactor*offset)))
% xlabel('Offset de símbolo (em porcentagem do período de símbolo)')
% ylabel('Estimativa de Offset')


% [amostras, offset] = ELGate(corruptSig, oFactor, 25,mLength, nt); %Aplica o algoritmo ELGate no sinal;
% r = sign(amostras) > 0; %Mapeia os símbolos BPSK em bits
% %stem(t3, amostras, 'g') %Plota as amostras tomadas com EL Gate
% %hold off
% 
% offset %Imprime o offset
% e2 = sum(xor(bits,r))/mLength %Calcula BER do sinal amostrado por EL Gate

