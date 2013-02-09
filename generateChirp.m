function generateChirp(chirp_fname,N, f1, f2, fs)
%%
%writes a chirp/sine-sweep file to the filename provided. 
% N is used to generate a sample size of 2's power(for easy FFT
% computation), f1 is start freq, f2 is stop freq of sime-sweep, fs is
% sampling rate

%Example Usage:
% f1=40;
% f2=8000;
% fs=16000;
% N=20;
%Since T = (2^N)/fs ,time = 131.072
% Thus, length= 2097152 samples (i.e, T*fs)
%%

T = (2^N)/fs;

% Create the swept sine tone
w1 = 2*pi*f1;
w2 = 2*pi*f2;
K = T*w1/log(w2/w1);
L = T/log(w2/w1);
t = linspace(0,T-1/fs,fs*T);
s = sin(K*(exp(t/L) - 1));

% Double the length so that it is easy to use cyclical (de)convolution
sdbl = [s s];

% Scaling by 0.9999 suppresses a Matlab warning message about clipping.
wavwrite(sdbl*0.9999,fs,chirp_fname);

end