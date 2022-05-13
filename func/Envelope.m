function [yupper,  ylower] = Envelope(inputArg)

z= Hilbert(inputArg);
env = abs(z);
yupper=env;
ylower=-env;

end