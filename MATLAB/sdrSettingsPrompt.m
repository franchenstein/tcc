%sdrSettingsPrompt.m
%This script will request the user for the configuration parameters for the SDR sim.

%------------------------------------------

clc
clear all

prev_config = 'x';

while (prev_config ~= 'y') && (prev_config ~= 'n')
	prev_config = input('Use previous configuration? (y/n) ', 's');
end

if prev_config == 'n'
	default_config = 'x';
	
	while (default_config ~= 'y') && (default_config ~= 'n')
		default_config = input('Use default configuration? (y/n) ', 's');
	end
	
	if default_config == 'y'
		mLength = 10000;         %Message length
		srcType = 'random';     %Source type
		srcFile = 'none';       %Message source path
		modSchm = 'PSK';        %Modulation scheme
		M = 2;                  %Number of levels for modulation scheme
		energy = 1;             %Energy with which the symbols will be normalized
		f = struct(...          %Pulse shaping filter parameters
			'type','Root-Raised-Cosine',... %Shape
			'sps', 10,...                   %Samples per symbol
			'T', 1,...                      %Symbol period
			'nt', 5,...                 %Parameter used for filter length
			'r', 0.5);                      %Roll-off factor
		psFilter = pulseShapingFilter(f);   %Pulse shaping filter
		oversample = f.sps;        %Oversampling factor
		synchAlg = 'Early-Late Gate';       %Symbol synch algorithm
		Fc = 433e6;                         %Carrier frequency
		Fs = 4*Fc;                          %Sample rate
		bpfParams = struct(...              %Demod's band-pass filter parameters
				'rolloff', 0.4,...      %Roll-off factor
				'q', f.sps,...          %Oversample factor
				'order', 64);           %FIR filter order
		%bpf = demodBPF(Fc, Fs, bpfParams);  %BPF coefficients
		%bpfParams = struct(...              %Demod's band-pass filter parameters
		%            'rolloff', 0.4,...      %Roll-off factor
		%            'q', f.sps,...          %Oversample factor
		%            'order', 64);           %FIR filter order
		%bpf = demodBPF(Fc, Fs, bpfParams);  %BPF coefficients
		synchWordLength = 255;
		codingAlgorithm = 'BCH';
		codingParams = struct(...
					'n', 255,...
					'k', 199);
					
		%Channel parameters:	
		timingOffset = 0;      %timing offset in % in the channel
		nGain = 0;            %Noise gain
		fp = 0;                 %Fading profile frequency
		fg = 1;                 %Fading profile gain (in %)
		theta = 0;           %Carrier phase offset
		
	else
		srcType = 0;
		while (strcmp(srcType,'random') == 0) && (strcmp(srcType,'file') == 0) && (strcmp(srcType,'image') == 0)
			srcType = input('What will be the source type? (random/file/image) ', 's');
		end
		
		if srcType == 'random'
			mLength = input('What is the length of the source message? ');
			srcFile = 'none';
		else
			mLength = 0;
			srcFile = input('What is the path to the source file? ', 's');
		end
		
		modSchm = 'PSK';
		M = 2;	
		disp('BPSK is the only modulation scheme currently supported');
		
		energy = input('What is the mean energy to be used? ');
		
		disp('Pulse shaping filter parameters:');
		type = 0;
		while (strcmp(type,'Root-Raised-Cosine') == 0) && (strcmp(type,'Gaussian') == 0) && (strcmp(type,'none') == 0)
			type = input('Choose a pulse shape. (none/Gaussian/Root-Raised-Cosine) ', 's');
		end
		sps = input('Choose the number of samples per second (oversampling factor). ');
		T = input('Choose the symbol period. ');
		r = input('Choose roloff factor. ');
		nt = input('Choose the number of symbols. ');
		f = struct(...
			'type', type,...
			'sps', sps,...
			'T', T,...
			'r', r,...
			'nt', nt);
		psFilter = pulseShapingFilter(f);
		
		Fc = input('Select a carrier frequency ');
		Fs = input('Select a sampling frequency ');
		
		disp('Band-pass filter parameters.');
		rolloff = input('Choose a rolloff factor. ');
		order = input('Choose an order, ');
		bpfParams = struct(...
					'rolloff', rolloff,...
					'q', f.sps,...
					'order', order);
					
		synchWordLength = 255;
		
		codingAlgorithm = 'BCH';
		disp('BCH code parameters:')
		n = input('Choose the size of the block (n) ');
		k = input('Choose the codeword size (k) ');
		codingParams = struct(...
						'n', n,...
						'k', k);
						
		disp('Channel model parameters: ')
		nGain = input('Select a noise amplitude. ');
		timingOffset = input('Select a timing offset (in % of symbol duration). ');
		fp = input('Select a fading profile frequency. ');
		fg = input('Select a fading profile gain (in %). ');
		theta = input('Select a phase offset (in radians). ');	
	
	end
	
	save('sdrSettings.mat')
else
	load('sdrSettings.mat');
end