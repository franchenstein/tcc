n = 10000;
m = 2;
constel = 2;
beta = 0.5;
l = 50;
chan = [1];
toffset = -1;
pulshap = srrc(l, beta, m, toffset);
s = pam(n, constel, 5);
sup = upsample(s, m);
hh = conv(pulshap, chan);
r = conv(hh, sup);
matchfilt = srrc(l, beta, m, 0);
x = conv(r, matchfilt);

tnow = l*m+1; tau = 0; xs = zeros(1,n);
tausave = zeros(1,n); tausave(1) = tau; i = 0;
mu = 0.01;
delta = 0.1;

while tnow < length(x) - l*m
    i = i + 1;
    xs(i) = interpsinc(x, tnow + tau, l);
    x_deltap = interpsinc(x, tnow + tau  + delta, l);
    x_deltan = interpsinc(x, tnow + tau - delta, l);
    dx = x_deltap - x_deltan;
    tau = tau + mu*dx*xs(i);
    tnow = tnow + m; tausave(i) = tau;
end

plot(tausave)
