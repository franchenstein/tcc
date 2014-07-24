function [sink_msg] = sink(rx_msg, type)
%sink - converts the received bit stream to its final form
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
        %nothing to do, the BER calculation is the last stop for random streams
        sink_msg = rx_msg;
    case 'file'
		r = [];
		for i = 1:length(rx_msg)
			r = [r num2str(rx_msg(i))];
		end
        A = bin2dec(vec2mat(r,7))';  %Converts stream to ascii decimals 
        sink_msg = char(A);				 %Converts decimals to char
        fileID = fopen('rx_msg.txt', 'w');
        fwrite(fileID, sink_msg);
    otherwise
        error('Invalid source type')
end

end

