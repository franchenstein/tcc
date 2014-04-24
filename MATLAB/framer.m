function [framed_message, synchWordLength] = framer(message)
%framer - Concatenates the header and the footer of the message. Currently
%it only puts the training sequence before the message.
%--------------------------------------------------------------------------
%   INPUTS:
%       message - the original bitstream of the message.                      
%   OUTPUTS:
%      framed_message - the same message, but now with headers and footers
%      included.
%   DESCRIPTION:
%    A header and a footer will be concatenated with the message on front
%    and at the end of it, respectively. They will be used in further
%    algorithms in the receiver. Currently, only a pre-defined training
%    sequence is available, that will be used both by the correlator and by
%    the equalizer.
%--------------------------------------------------------------------------

frame_synchronization_word = load('mSequence.mat');
frame_synchronization_word = frame_synchronization_word.sequence;
frame_synchronization_word = double(frame_synchronization_word > 0);

framed_message = [frame_synchronization_word, message];
synchWordLength = length(frame_synchronization_word);

end

