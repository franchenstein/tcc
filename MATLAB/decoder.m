function decMsg = decoder(code, algorithm, params, L)
%decoder - applies error correcting decoding algorithm to the received bits.
%--------------------------------------------------------------------------
%   INPUTS:
%       code - the received coded and corrupted message;
%       algorithm - The ECC algorithm. At this moment it can assume the
%                   following values:
%                       -none;
%                       -Hamming;
%                       -BCH; 
%       params - a structure with the appropriate parameters for the decoding;
%       L - the original message length.
%   OUTPUTS:
%      decMsg - the recovered decoded message.
%   DESCRIPTION:
%    For error correction purposes, the chosen algorithm is applied to the
%    message with the appropriate parameters, generating a message with an
%    overhead that will be used to correct errors caused by the channel noise.
%--------------------------------------------------------------------------

    switch(algorithm)
        case 'none'
            decMsg = code;
        case 'Hamming'
            decMsg = decode(code, params.n, params.k, 'hamming/binary');
        case 'BCH'
            decoder = comm.BCHDecoder('CodewordLength', params.n, 'MessageLength', params.k);
            decMsg = step(decoder,code')';
        otherwise
            error('ECC method not implemented or invalid.');
    end
    
    
    decMsg = decMsg(1:L); %removes any padding added in the encoder.

end
