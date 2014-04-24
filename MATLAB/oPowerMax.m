function [samples offset] = oPowerMax(inSig, oFactor, L, mLength, del)

x = inSig;

tnow = L*oFactor+1;
tau = 0; xs = zeros(1,mLength);
tausave = zeros(1,mLength); tausave(1) = tau; i = 0;
mu = 0.01;

while tnow < length(x) - L*oFactor
    i = i + 1;
    xs(i) = x(ceil(tnow+tau*oFactor));
    x_deltap = x(ceil(tnow+tau*oFactor)+del);
    x_deltan = x(ceil(tnow+tau*oFactor)-del);
    dx = x_deltap - x_deltan;
    tau = tau + mu*dx*xs(i);
    ceil(tau*oFactor);
    tnow = tnow + oFactor; tausave(i) = tau;
    
end

samples = xs;
offset = round(tau*oFactor);

plot(tausave);

end