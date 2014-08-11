function [sink_msg] = sink(rx_msg, type, sinkFile)
%sink - converts the received bit stream to its final form
%--------------------------------------------------------------------------
%   INPUTS:
%       -rx_msg: the final processed received bits;
%       -type: the type of message that was sent (random, file or image).
%   OUTPUTS:
%       -sink_msg: the estimated message.
%   DESCRIPTION:
%       Recreates the estimation of original message from the received
%       bitstream.
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
        fileID = fopen(sinkFile, 'w');
        fwrite(fileID, sink_msg);
    otherwise
        error('Invalid source type')
end

end

