function [codedMsg, mLength] = coder(msg, algorithm, params, L)
%coder - applies error correcting code algorithm to the message bits.
%--------------------------------------------------------------------------
%   INPUTS:
%       msg - the original message bits;
%       algorithm - The ECC algorithm. At this moment it can assume the
%                   following values:
%                       -none;
%                       -Hamming;
%                       -BCH; 
%       params - a structure with the appropriate parameters for the coding;
%       L - the original message length. 
%   OUTPUTS:
%      codedMsg - The final coded message;
%      mLength - the coded message length.
%   DESCRIPTION:
%    For error correction purposes, the chosen algorithm is applied to the
%    message with the appropriate parameters, generating a message with an
%    overhead that will be used to correct errors caused by the channel noise.
%--------------------------------------------------------------------------

    switch(algorithm)
        case 'none'
            codedMsg = msg;
            mLength = L;
        case 'Hamming'
            codedMsg = encode(msg, params.n, params.k, 'hamming/binary');
            mLength = (params.n/params.k)*L;
        case 'BCH'
            encoder = comm.BCHEncoder('CodewordLength', params.n, 'MessageLength', params.k);
            codedMsg = step(encoder,msg')';
            mLength = (params.n/params.k)*L;
        otherwise
            error('ECC method not implemented or invalid.');
    end

end
