function [inst_amplitude,inst_phase,inst_freq] = Instinfo(x,fs)

z = hilbert(x);
inst_amplitude = abs(z);
inst_phase = unwrap(angle(z));
inst_freq = diff(inst_phase)/(2*pi)*fs;

end
