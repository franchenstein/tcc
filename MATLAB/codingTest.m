%coding test
L = 1005;
p = 0.01;

msg = double(rand(1,L) > 0.5);
a = zeros(1,100);
algorithm = 'none'
n = 7;
k = L;
params = struct('n', n, 'k', k);
for i = 1:100
    code = coder(msg, algorithm, params);
    
    noise = double(rand(1,length(code)) < p);


    r = double(xor(code,noise));

    newmsg = decoder(r, algorithm, params, L);
    
    ber = bitErrorRate(msg, newmsg);
    
    a(i) = ber;
    
end

b = zeros(1,100);
algorithm = 'Hamming'
n = 7;
k = 4;
params = struct('n', n, 'k', k);
for i = 1:100
    code = coder(msg, algorithm, params);
    
    noise = double(rand(1,length(code)) < p);

    r = double(xor(code,noise));

    newmsg = decoder(r, algorithm, params,L);

    ber = bitErrorRate(msg, newmsg);
    
    b(i) = ber;
    
end

c = zeros(1,100);
algorithm = 'BCH'
n = 255;
k = 199;
params = struct('n', n, 'k', k);
for i = 1:100
    code = coder(msg, algorithm, params);
    
    noise = double(rand(1,length(code)) < p);

    r = double(xor(code,noise));

    newmsg = decoder(r, algorithm, params,L);

    ber = bitErrorRate(msg, newmsg);
    
    c(i) = ber;
    
end

am = mean(a);
bm = mean(b);
cm = mean(c);

fprintf('No ECC mean BER: %2.4f%%. \n', 100*am);
fprintf('Hamming code mean BER: %2.4f%%. \n', 100*bm);
fprintf('BCH code mean BER: %2.4f%%. \n', 100*cm);
