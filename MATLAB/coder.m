function [codedMsg, cLength] = coder(msg, algorithm, params)
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
%   OUTPUTS:
%      codedMsg - The final coded message;
%      codeLength - the coded message length.
%   DESCRIPTION:
%    For error correction purposes, the chosen algorithm is applied to the
%    message with the appropriate parameters, generating a message with an
%    overhead that will be used to correct errors caused by the channel noise.
%--------------------------------------------------------------------------

    msg = codePadding(msg, params.k);

    switch(algorithm)
        case 'none'
            codedMsg = msg;
            cLength = length(msg);
        case 'Hamming'
            codedMsg = encode(msg, params.n, params.k, 'hamming/binary');
            cLength = (params.n/params.k)*length(msg);
        case 'BCH'
            encoder = comm.BCHEncoder('CodewordLength', params.n, 'MessageLength', params.k);
            codedMsg = step(encoder,msg')';
            cLength = (params.n/params.k)*length(msg);
        otherwise
            error('ECC method not implemented or invalid.');
    end

end
