function [source_bits, mLength] = source(type, mLength, filepath)
%source - creates the source's bit stream
%--------------------------------------------------------------------------
%   INPUTS:
%       -type: string, can be either "random" or "file";
%       -length: user-defined length for the random message;
%       -filepath: path where the message is located.
%   OUTPUTS:
%       -source_bits: the message bit stream.
%		-mLength: final message length.
%   DESCRIPTION:
%       Generates the bit stream of the source. If the type is "random", a
%       random bit stream will be generated with the user defined length.
%       In case "file" is chosen, the file in filepath will be loaded and
%       the length will be ignored.
%--------------------------------------------------------------------------

switch(type)
    case 'random'
        source_bits = (rand(1,mLength) > 0.5);
    case 'file'
        A = dec2bin(fileread(filepath))'; %Converts ASCII file to bits
        A = A(:)';               %Serializes bits
        for i = 1:length(A)
			source_bits(i) = str2num(A(i));
		end
    otherwise
        error('Invalid source type')
end

mLength = length(source_bits);

end

