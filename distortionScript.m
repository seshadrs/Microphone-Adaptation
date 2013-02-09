function distortionScript(dirName, chirpFileName, recordingFileName)
%%
%Inputs the directory name as a string and distorts every WAV file inside
%the directory.
%It finds the WAV files recursively.
% It also takes the chirpFile location and the recordingFile names to
% calculate the impulse used for distortion.
%%


h=geth(chirpFileName,recordingFileName);
padded_h=zeroPadding(h);

distortFiles(dirName,padded_h);

end
