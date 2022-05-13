function [Power, Frequency] = WelchPSD(Data1, Data2, Window, OverlapFactor, SamplingFrequency)
% Data1 - Input vector for the power spectral density estimate.
% Data2 - Required vector when cross power spectral density shall be estimated, in other cases can be left empty [].
% Window- Window function as vector for Welch's method.
% OverlapFactor - Overlapping factor for Welch's method. 
% SamplingFrequency - Sampling frequency.
% Power - Complex power estimate.
% Frequency - Frequency vector for the resulting power estimate.
if ~isvector(Data1) || (~isempty(Data2) && ~isvector(Data2)) || ~isvector(Window)
error('Data1, Data2 and Window must be vectors.')
end

if ~isempty(Data2) && (length(Data1) ~= length(Data2))
error('Data1 and Data2 must be the same length.')
end

if length(Window)~=1 && length(Window) > length(Data1)
error('Length of Data1 must be 1 or equal/greater than lenght of Window.')
end

if ~isscalar(SamplingFrequency) || ~isscalar(OverlapFactor)
error('SamplingFrequency and OverlapFactor must be scalars.')
end

Data1   = Data1(:);
Data2   = Data2(:);
Window  = Window(:);
DataLength  = numel(Data1);

%% Welch's method

WindowCompensation  = Window' * Window;
SegmentLength   = length(Window);
SegmentOverlapLength= round(SegmentLength * OverlapFactor);
SegmentIndices  = (1 : SegmentLength)';
FftLength   = 2^nextpow2(SegmentLength);
Power   = 0;
SegmentCounter  = 0;

while true
  
if isempty(Data2)
Segment1  	= fft(Data1(SegmentIndices) .* Window, FftLength);
Power   = Power + Segment1 .* conj(Segment1);
else
Segment1	= fft(Data1(SegmentIndices) .* Window, FftLength);
Segment2   	= fft(Data2(SegmentIndices) .* Window, FftLength);
Power   = Power + Segment1 .* conj(Segment2);
end

SegmentCounter	= SegmentCounter + 1;
SegmentIndices 	= SegmentIndices + (SegmentLength - SegmentOverlapLength);

if SegmentIndices(end) > DataLength
break
end

end

% Parseval's Law: PSD / df = PSD * N / fs
Power   = Power / (SegmentCounter * WindowCompensation);
Power   = Power(1 : end/2 + 1) / SamplingFrequency;
Power(2 : end - 1)  	= Power(2 : end - 1) * 2;

Frequency 	= SamplingFrequency / 2 * linspace(0, 1, FftLength / 2 + 1).';   
end