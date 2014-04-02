%This script compares my implementation of the Early-Late Algorithm against
%the one that was used previously.

%TX
bits = source('random', 1000, 3);
symbols = mapper(bits, 'PSK', 2, 1);
f = struct('type', 'Root-Raised-Cosine', 'sps', 16, 'T', 1, 'length', 25, 'r', 0.5);
psFilter = pulseShapingFilter(f);
pulses = pulseShaping(symbols, 16, psFilter, f);

%RX
r_pulses = matchedFiltering(pulses, psFilter);
c1 = now;
for i = 1:100
    r_synch = symbolSynchTest(r_pulses, 16, 'Early-Late Gate');
end
c2 = now;
T1 = c2 - c1;

c3 = now;
for i = 1:100
    r_synch = symbolSynchTest(r_pulses, 16, 'test');
end
c4 = now;
T2 = c4 - c3;

fprintf('My algorithm: %6.2e seconds.\n', T1);
fprintf('Previous algorithm: %6.2e seconds.\n', T2);
fprintf('My algorithm is %6.2f times faster than the previous one.\n', T2/T1);
