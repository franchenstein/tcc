%agcTest - tests the agc block

clear all;
close all;

n = 50000;
r = randn(size(1:n));
figure()
plot(r);
axis([0 n -5 5])
lr = length(r);
fp = 0.75*abs(sin(2*pi*(1:n)/n)); %flat fading profile
r = r.*fp;
figure()
plot(r)

cR = agc(r);

figure()
plot(cR)
axis([0 n -5 5])