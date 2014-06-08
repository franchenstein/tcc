function [paddedMsg] = codePadding(msg, k)
%codePadding - Pads message so it can be divided in equal blocks.


    L = length(msg);
    p = mod(L,k);
    if (p ~= 0)
        padlength = k - p;
        pad = double(rand(1,padlength) > 0.5);
        paddedMsg = [msg pad];
    else
        paddedMsg = msg;
    end
            
end
