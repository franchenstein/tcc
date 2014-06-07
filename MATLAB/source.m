function [source_bits] = source(type, length, filepath)
%source - creates the source's bit stream
%--------------------------------------------------------------------------
%   INPUTS:
%       -type: string, can be either "random" or "file";
%       -length: user-defined length for the random message;
%       -filepath: path where the message is located.
%   OUTPUTS:
%       -source_bits: the message bit stream.
%   DESCRIPTION:
%       Generates the bit stream of the source. If the type is "random", a
%       random bit stream will be generated with the user defined length.
%       In case "file" is chosen, the file in filepath will be loaded and
%       the length will be ignored.
%--------------------------------------------------------------------------

switch(type)
    case 'random'
        source_bits = (rand(1,length) > 0.5);
    case 'file'
        A = dec2bin(loaddata(filepath))'; %Converts ASCII file to bits
        source_bits = A(:);               %Serializes bits
    otherwise
        error('Invalid source type')
end

end

