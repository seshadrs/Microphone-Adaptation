function  distortFiles(dirName, padded_h)
%%
% Distorts all the wav files in the directory name given as input argument.
% Zero padded value of h is also input.
% looks for wav files recursively. It overwrites the wav files with the
% distorted file.
%%

 
  dirData = dir(dirName);      %# Get all the data for the current directory
  
  
  WAVFIleList=dir(strcat(dirName,'\*.wav'));
  dirIndex = [WAVFIleList.isdir];
  fileList = {WAVFIleList(~dirIndex).name}';  %'# Get a list of the files
  
  dirIndex = [dirData.isdir];  %# Find the index for directories
  
  if ~isempty(fileList)
    fileList = cellfun(@(x) fullfile(dirName,x),...  %# Prepend path to files
                       fileList,'UniformOutput',false);
                   
                   
                   for i = [1: length(fileList)]
                       cFName = fileList(i);
                       fName=char(cFName);
                       disp(fName);
                       [rec, fr]=wavread(fName);
                       rec=rec*4.00; %scaling for higher amplitude
                       pad_rec=zeroPadding(rec, log2(length(padded_h)));
                       distorted_rec=real(ifft(fft(pad_rec).*fft(padded_h)));
                       displacement=.183*fr;
                       wavwrite(distorted_rec(displacement:displacement+length(rec)),fr,fName);
                       
                   end
    
  end
  subDirs = {dirData(dirIndex).name};  %# Get a list of the subdirectories
  validIndex = ~ismember(subDirs,{'.','..'});  %# Find index of subdirectories
                                               %#   that are not '.' or '..'
  for iDir = find(validIndex)                  %# Loop over valid subdirectories
    nextDir = fullfile(dirName,subDirs{iDir});    %# Get the subdirectory path
    distortFiles(nextDir,padded_h);  %# Recursively call getAllFiles
  end

end