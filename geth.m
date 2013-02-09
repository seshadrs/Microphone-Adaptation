function h= geth(sinesweep,response)
%%
%Returns 'h', the impulse. 
% Takes as inputs the sinesweep file name(double the signal-->for easy
% deconvolution) and the filename of the 
% complete response recorded)
%%

sdbl = wavread(sinesweep);
L = length(sdbl);
scycl = sdbl(L/2+1:L);
[rdbl, fs] = wavread(response);
rcycl = rdbl(L/2+1:L);
Fs = fft(scycl);
N = length(scycl);
h = ifft(fft(rcycl)./Fs);
h = real(h);

end
