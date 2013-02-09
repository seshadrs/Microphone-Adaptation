function output= distortArray(h,recording_fname)
%%
%Returns the distorted array sequence
%takes as input 'h', the impulse and the wav-file name
%%

[rec, fr]=wavread(recording_fname);
rec=rec*10.00; %scaling for higher amplitude

pad_h=zeroPadding2N(h);
pad_rec=zeroPadding2N(rec, log2(length(h)));

distorted_rec=real(ifft(fft(pad_rec).*fft(pad_h)));

displacement=.183*16000;
output= distorted_rec(displacement:displacement+length(rec);

wavwrite(distorted_rec(displacement:displacement+length(rec)),16000,'results\pad_distorted_sample.wav');